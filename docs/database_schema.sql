-- Esquema base para Bitácoras de Soporte

CREATE TABLE users (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE clients (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  document_number VARCHAR(50) NULL,
  email VARCHAR(255) NULL,
  phone VARCHAR(50) NULL,
  company VARCHAR(255) NULL,
  status ENUM('active','inactive') DEFAULT 'active',
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE support_types (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL UNIQUE,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE TABLE support_logs (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  client_id BIGINT UNSIGNED NOT NULL,
  advisor_id BIGINT UNSIGNED NOT NULL,
  support_type_id BIGINT UNSIGNED NOT NULL,
  attention_date DATE NOT NULL,
  description TEXT NOT NULL,
  result_status ENUM('pendiente','resuelto','escalado','cancelado') DEFAULT 'pendiente',
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  CONSTRAINT fk_support_logs_client FOREIGN KEY (client_id) REFERENCES clients(id),
  CONSTRAINT fk_support_logs_advisor FOREIGN KEY (advisor_id) REFERENCES users(id),
  CONSTRAINT fk_support_logs_support_type FOREIGN KEY (support_type_id) REFERENCES support_types(id)
);

CREATE INDEX idx_support_logs_attention_date ON support_logs(attention_date);
CREATE INDEX idx_support_logs_advisor ON support_logs(advisor_id);
CREATE INDEX idx_support_logs_client ON support_logs(client_id);
