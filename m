Return-Path: <linux-next+bounces-5742-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5866A5C39E
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 15:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E67657A1E2F
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 14:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7931BB6BA;
	Tue, 11 Mar 2025 14:17:28 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEFF1C5D61;
	Tue, 11 Mar 2025 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702648; cv=none; b=f2JTOflkVSydf+Tba3FQweiIYjf8G6RD3UTI2fBOHwDWfVEMBjnBG5Qq7QLDX2J5NHzPfKcr2ZFzWzVDBnwCwkyhzW4LBdNqohepSRDDaTO1NRyQbUobxOUB7gp2mPaL3SO7k5bRpXlXFEw2kKzYCiiOdbiUynOh/YCygs4fU74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702648; c=relaxed/simple;
	bh=txT6ecDe6SJc28gdi7DRBSzVeUr4dFoNyVNQOww37jI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BwhNLqpHE1S7llTtd8ftvvRfs1DgEkZmyMUXjYkKy3tZuBqnW2EexZzY5s/cLr6MFOd0MeLpR6RlSx8GRWQj3JpPfaGs5UZUFWAe7kxuGbEBagt2qj3FFzXbBvpgsjwhWcS839v7CiHIs2rQmlJHOB+XcFa2pubdK2iSVFyiLas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47CED1516;
	Tue, 11 Mar 2025 07:17:37 -0700 (PDT)
Received: from beelzebub.ast.arm.com (u203013-lin.austin.arm.com [10.118.28.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E2D43F694;
	Tue, 11 Mar 2025 07:17:26 -0700 (PDT)
From: Stuart Yoder <stuart.yoder@arm.com>
To: jarkko@kernel.org,
	sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/5] Documentation: tpm: add documentation for the CRB FF-A interface
Date: Tue, 11 Mar 2025 09:17:18 -0500
Message-Id: <20250311141718.145276-1-stuart.yoder@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation providing details of how the CRB driver interacts
with FF-A.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stuart Yoder <stuart.yoder@arm.com>
---
 Documentation/security/tpm/index.rst       |  1 +
 Documentation/security/tpm/tpm_ffa_crb.rst | 65 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/security/tpm/tpm_ffa_crb.rst

diff --git a/Documentation/security/tpm/index.rst b/Documentation/security/tpm/index.rst
index fa593d960040..deda952eacbe 100644
--- a/Documentation/security/tpm/index.rst
+++ b/Documentation/security/tpm/index.rst
@@ -10,3 +10,4 @@ Trusted Platform Module documentation
    tpm_vtpm_proxy
    xen-tpmfront
    tpm_ftpm_tee
+   tpm_ffa_crb
diff --git a/Documentation/security/tpm/tpm_ffa_crb.rst b/Documentation/security/tpm/tpm_ffa_crb.rst
new file mode 100644
index 000000000000..0184193da3c7
--- /dev/null
+++ b/Documentation/security/tpm/tpm_ffa_crb.rst
@@ -0,0 +1,65 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+TPM CRB over FF-A Driver
+========================
+
+The TPM Command Response Buffer (CRB) interface is a standard TPM interface
+defined in the TCG PC Client Platform TPM Profile (PTP) Specification [1]_.
+The CRB provides a structured set of control registers a client uses when
+interacting with a TPM as well as a data buffer for storing TPM commands and
+responses. A CRB interface can be implemented in:
+
+- hardware registers in a discrete TPM chip
+
+- in memory for a TPM running in isolated environment where shared memory
+  allows a client to interact with the TPM
+
+The Firmware Framework for Arm A-profile (FF-A) [2]_ is a specification
+that defines interfaces and protocols for the following purposes:
+
+- Compartmentalize firmware into software partitions that run in the Arm
+  Secure world environment (also know as TrustZone)
+
+- Provide a standard interface for software components in the Non-secure
+  state, for example OS and Hypervisors, to communicate with this firmware.
+
+A TPM can be implemented as an FF-A secure service.  This could be a firmware
+TPM or could potentially be a TPM service that acts as a proxy to a discrete
+TPM chip. An FF-A based TPM abstracts hardware details (e.g. bus controller
+and chip selects) away from the OS and can protect locality 4 from access
+by an OS.  The TCG-defined CRB interface is used by clients to interact
+with the TPM service.
+
+The Arm TPM Service Command Response Buffer Interface Over FF-A [3]_
+specification defines FF-A messages that can be used by a client to signal
+when updates have been made to the CRB.
+
+How the Linux CRB driver interacts with FF-A is summarized below:
+
+- The tpm_crb_ffa driver registers with the FF-A subsystem in the kernel
+  with an architected TPM service UUID defined in the CRB over FF-A spec.
+
+- If a TPM service is discovered by FF-A, the probe() function in the
+  tpm_crb_ffa driver runs, and the driver initializes.
+
+- The probing and initialization of the Linux CRB driver is triggered
+  by the discovery of a TPM advertised via ACPI.  The CRB driver can
+  detect the type of TPM through the ACPI 'start' method.  The start
+  method for Arm FF-A was defined in TCG ACPI v1.4 [4]_.
+
+- When the CRB driver performs its normal functions such as signaling 'start'
+  and locality request/relinquish it invokes the tpm_crb_ffa_start() funnction
+  in the tpm_crb_ffa driver which handles the FF-A messaging to the TPM.
+
+References
+==========
+
+.. [1] **TCG PC Client Platform TPM Profile (PTP) Specification**
+   https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/
+.. [2] **Arm Firmware Framework for Arm A-profile (FF-A)**
+   https://developer.arm.com/documentation/den0077/latest/
+.. [3] **Arm TPM Service Command Response Buffer Interface Over FF-A**
+   https://developer.arm.com/documentation/den0138/latest/
+.. [4] **TCG ACPI Specification**
+   https://trustedcomputinggroup.org/resource/tcg-acpi-specification/
-- 
2.34.1


