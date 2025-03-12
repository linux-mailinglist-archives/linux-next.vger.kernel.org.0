Return-Path: <linux-next+bounces-5765-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC11A5D5F0
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 07:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C57A174903
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 06:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6321DE8B3;
	Wed, 12 Mar 2025 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHo7dNC9"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91561925A2;
	Wed, 12 Mar 2025 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741760285; cv=none; b=cN5/nlhDiPQZZhGXyfI7zTRcELpo4GNWjae49w0X90hqKhOwXPTvHetnaL18aOcCfTpEGln6rMbcufqbYMIGOYzdpHlFrPZPuJ7p5OfV6To1bIHYZ6ywmvxYFmN3g4WeAJC2ooJoKos+DvAmFmRVLaEljI2boQ4ccSgjCX5P6kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741760285; c=relaxed/simple;
	bh=SIIRA/IaGAGW0+GTgHgB1CPsQFPU3Jrkrdi0uZ5ot1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJpJWrvX3Jd6fv3prn/JD9CJKuVjzkNNluajMbsAhlEG/36i7d12npyHKAXhJuNlLG+zpZPRL+2dBd8HSf7zQRO+usIBMDzp4aYEL1ad9EanDyHaUNNwzdtLLW5iDxo17cx+MpJ5HLM7bt5z00E3nN6PTFnjGcgbpfH5Uw0o/30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHo7dNC9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F80C4CEE3;
	Wed, 12 Mar 2025 06:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741760285;
	bh=SIIRA/IaGAGW0+GTgHgB1CPsQFPU3Jrkrdi0uZ5ot1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHo7dNC9RB0LvRuTbEFUJO6LHL+PRTcSA83Iq4ppqs0I+U9zvfEHVvLohKhPfElCv
	 8aDeB3CBTWFBDM6NHcP5kiFjnG8A0c65ktBa8i91aQWr1J760TVi9vthAe7xqgQP2d
	 RmgWa6ggcLobv+xSRHfiotYPIfq/MbFnrn8k1whj9MXQe2NuvOAPgObhK3qnsmsgNu
	 Wn/B6/058udiFW2UmURIyu9x4sWgM8WZDOmLmtGRyzwGg/hamIiXjEdAZLuv9TGVlG
	 v0ioQmhrW580GbkLcGGfAVGnKnXroF3q9T0BIo/LQ/urJv6Lx0R1Rq6B8qX/yyQEwQ
	 v2+IaagEcr7ZA==
Date: Wed, 12 Mar 2025 08:18:01 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stuart Yoder <stuart.yoder@arm.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/5] Documentation: tpm: add documentation for the CRB
 FF-A interface
Message-ID: <Z9EnGfQGMZhn1JVF@kernel.org>
References: <20250311141718.145276-1-stuart.yoder@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311141718.145276-1-stuart.yoder@arm.com>

On Tue, Mar 11, 2025 at 09:17:18AM -0500, Stuart Yoder wrote:
> Add documentation providing details of how the CRB driver interacts
> with FF-A.
> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Stuart Yoder <stuart.yoder@arm.com>
> ---
>  Documentation/security/tpm/index.rst       |  1 +
>  Documentation/security/tpm/tpm_ffa_crb.rst | 65 ++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>  create mode 100644 Documentation/security/tpm/tpm_ffa_crb.rst
> 
> diff --git a/Documentation/security/tpm/index.rst b/Documentation/security/tpm/index.rst
> index fa593d960040..deda952eacbe 100644
> --- a/Documentation/security/tpm/index.rst
> +++ b/Documentation/security/tpm/index.rst
> @@ -10,3 +10,4 @@ Trusted Platform Module documentation
>     tpm_vtpm_proxy
>     xen-tpmfront
>     tpm_ftpm_tee
> +   tpm_ffa_crb
> diff --git a/Documentation/security/tpm/tpm_ffa_crb.rst b/Documentation/security/tpm/tpm_ffa_crb.rst
> new file mode 100644
> index 000000000000..0184193da3c7
> --- /dev/null
> +++ b/Documentation/security/tpm/tpm_ffa_crb.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========================
> +TPM CRB over FF-A Driver
> +========================
> +
> +The TPM Command Response Buffer (CRB) interface is a standard TPM interface
> +defined in the TCG PC Client Platform TPM Profile (PTP) Specification [1]_.
> +The CRB provides a structured set of control registers a client uses when
> +interacting with a TPM as well as a data buffer for storing TPM commands and
> +responses. A CRB interface can be implemented in:
> +
> +- hardware registers in a discrete TPM chip
> +
> +- in memory for a TPM running in isolated environment where shared memory
> +  allows a client to interact with the TPM
> +
> +The Firmware Framework for Arm A-profile (FF-A) [2]_ is a specification
> +that defines interfaces and protocols for the following purposes:
> +
> +- Compartmentalize firmware into software partitions that run in the Arm
> +  Secure world environment (also know as TrustZone)
> +
> +- Provide a standard interface for software components in the Non-secure
> +  state, for example OS and Hypervisors, to communicate with this firmware.
> +
> +A TPM can be implemented as an FF-A secure service.  This could be a firmware
> +TPM or could potentially be a TPM service that acts as a proxy to a discrete
> +TPM chip. An FF-A based TPM abstracts hardware details (e.g. bus controller
> +and chip selects) away from the OS and can protect locality 4 from access
> +by an OS.  The TCG-defined CRB interface is used by clients to interact
> +with the TPM service.
> +
> +The Arm TPM Service Command Response Buffer Interface Over FF-A [3]_
> +specification defines FF-A messages that can be used by a client to signal
> +when updates have been made to the CRB.
> +
> +How the Linux CRB driver interacts with FF-A is summarized below:
> +
> +- The tpm_crb_ffa driver registers with the FF-A subsystem in the kernel
> +  with an architected TPM service UUID defined in the CRB over FF-A spec.
> +
> +- If a TPM service is discovered by FF-A, the probe() function in the
> +  tpm_crb_ffa driver runs, and the driver initializes.
> +
> +- The probing and initialization of the Linux CRB driver is triggered
> +  by the discovery of a TPM advertised via ACPI.  The CRB driver can
> +  detect the type of TPM through the ACPI 'start' method.  The start
> +  method for Arm FF-A was defined in TCG ACPI v1.4 [4]_.
> +
> +- When the CRB driver performs its normal functions such as signaling 'start'
> +  and locality request/relinquish it invokes the tpm_crb_ffa_start() funnction
> +  in the tpm_crb_ffa driver which handles the FF-A messaging to the TPM.
> +
> +References
> +==========
> +
> +.. [1] **TCG PC Client Platform TPM Profile (PTP) Specification**
> +   https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/
> +.. [2] **Arm Firmware Framework for Arm A-profile (FF-A)**
> +   https://developer.arm.com/documentation/den0077/latest/
> +.. [3] **Arm TPM Service Command Response Buffer Interface Over FF-A**
> +   https://developer.arm.com/documentation/den0138/latest/
> +.. [4] **TCG ACPI Specification**
> +   https://trustedcomputinggroup.org/resource/tcg-acpi-specification/
> -- 
> 2.34.1
> 

LGTM

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

