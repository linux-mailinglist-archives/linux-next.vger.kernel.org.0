Return-Path: <linux-next+bounces-5230-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58958A137C2
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 11:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1E6A3A2E04
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 10:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0191DA60B;
	Thu, 16 Jan 2025 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1LPWNDf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D728019006B;
	Thu, 16 Jan 2025 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737023144; cv=none; b=TQCx6YxfIPjDBzOitPB/k77UlwgHNHM2Ql/shxtoh49M7PLUu5TfLwA3yv/VpGDlJ+afTWBRSYw4ujZK8f2KMn0CSbuCc+0fgZajOsGQfigcgMZMs52DauK7kyfxmrrxoAsQ2hotCI5FpaeTY87sJBol4zIEpSXH3SRK9ZOVgU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737023144; c=relaxed/simple;
	bh=FVxcbNY8wv5wmXGk3cR2kjheV6TgpMh0efDLkSZD4N4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uA073meeBMK7dKmj/I8kkdMSOMOX+QVO/q5L5v8WdQeMsdXRgMsGWjlhs3fs+B0uUHxONv4t4g65eS1dmoIQUbtkEpSHF9JaWT4MDaNqqYevKw5Ip1oKF9WyBclwlmHwbYz58CpK1xe39rDBMGqmhVujcwAZ1fHkX0M9zm3p/RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1LPWNDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527F8C4CED6;
	Thu, 16 Jan 2025 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737023144;
	bh=FVxcbNY8wv5wmXGk3cR2kjheV6TgpMh0efDLkSZD4N4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B1LPWNDfCaq/mmLoJcKSxNKbtNwmCn9UbXystsD9rYS86/79tAJayui1R9tfXDiV9
	 DBcGfu+Hb7pS3MtrkBM5d7fYDx0gWMQgmlsYHwPIr8iP8oqCFgb173TNQatVIFNVQe
	 IgR9LfPqCubgiZ+YC80fVGxY+QKRblb5Ck4CTndenpKrLbVmid7dHC1AcYYF5+co1q
	 eAFgr+9gPhJLcRM9r5wSeB2mwHa3wmFXtTCDt2iwbFodDWBvGZXjCi7M8zWJ4rtfWn
	 NNS310tU5UvmtYP134oUTA+DjOEP7aQxdRTjfcGJsAsZVVLlMGasoeRfwYRbcvmBeJ
	 WSshrKFjhxffw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tYN4I-00ClgH-39;
	Thu, 16 Jan 2025 10:25:42 +0000
Date: Thu, 16 Jan 2025 10:25:40 +0000
Message-ID: <864j1zvyvv.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoffer Dall <cdall@cs.columbia.edu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kvm-arm tree
In-Reply-To: <20250116171320.5f3aeae6@canb.auug.org.au>
References: <20250116171320.5f3aeae6@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: sfr@canb.auug.org.au, cdall@cs.columbia.edu, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Thu, 16 Jan 2025 06:13:20 +0000,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> Hi all,
> 
> After merging the kvm-arm tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/virt/kvm/devices/vcpu.rst:147: WARNING: Definition list ends without a blank line; unexpected unindent.
> 
> Introduced by commit
> 
>   affd1c83e090 ("KVM: arm64: nv: Document EL2 timer API")
> 
> I missed this when it was introduced, sorry.

Thanks for the heads up. I'm stashing this on top:

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index d62ba86ee1668..31a9576c07afa 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -142,9 +142,8 @@ the cpu field to the processor id.
 
 :Architectures: ARM64
 
-2.1. ATTRIBUTES: KVM_ARM_VCPU_TIMER_IRQ_VTIMER, KVM_ARM_VCPU_TIMER_IRQ_PTIMER,
-                 KVM_ARM_VCPU_TIMER_IRQ_HVTIMER, KVM_ARM_VCPU_TIMER_IRQ_HPTIMER,
---------------------------------------------------------------------------------
+2.1. ATTRIBUTES: KVM_ARM_VCPU_TIMER_IRQ_{VTIMER,PTIMER,HVTIMER,HPTIMER}
+-----------------------------------------------------------------------
 
 :Parameters: in kvm_device_attr.addr the address for the timer interrupt is a
 	     pointer to an int


Cheers,

	M.

-- 
Without deviation from the norm, progress is not possible.

