Return-Path: <linux-next+bounces-7525-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5775DB045DE
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 18:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B55B3B4BCA
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 16:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DE528EA;
	Mon, 14 Jul 2025 16:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Us816Ql9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767D433991
	for <linux-next@vger.kernel.org>; Mon, 14 Jul 2025 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752511807; cv=none; b=ZmkB1ymXDBIcZgfAKgI8N3+MqL0lgC02Yo8hbQ/FpXZoy1DVmrcfVkTbYDHolWyomfKqxPkkv4hjowxm3mo10wPuvQX1jyDqJGaDhWQuQ4KoG2Sm+JkKSt4GgKwPUj+dYjp8P1Tq8Dq9AzEaMaS3c8p14BzjdJEixhpuvT02UkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752511807; c=relaxed/simple;
	bh=+u8ijcOJ3zljOgtWN6MeFwvJau7rJ8FUIfUEVt/tOig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lSnhD/yOafDUwxolSWJSKAPq+f/W7nCRxoPtO3m5ngH2S34+ubMvtFXvRs5yjh2Z4vUbvnphHUx/J4F8rqR5uQ4qadw9R7YeTN66jSTGDU9TKK1Kr61mqsYS6TsYb8L2810X0f2KuCIdTeKk8TuGpeMTrsIR8kjV0bKfXBEcis8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Us816Ql9; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748efefedb5so4216486b3a.2
        for <linux-next@vger.kernel.org>; Mon, 14 Jul 2025 09:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752511806; x=1753116606; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/lRA3Lmbx+WYHtJuKxkOr0j62kfUWW7KunEBa7xsiUM=;
        b=Us816Ql9D2m6XXChO7/AVpBQYkJ3g5EyK9s9j5ZXJLTCyFVLP8EE+w7i0JaxqaAqyV
         XNPBtm+n0+l2jl4Q4mPX1XV6A8qtdHdVtdQ7g8kWRuE2DTsunFXDuOLqRjlshUkQyDcU
         H3sqtHtSuAoMpFoRdkasVVAakAP1rcMimVUrIeRmjPp6rOiHjySTcsFW1a0NJjED1WEO
         BRXxTn/1XBJsu0dvqh3zvHpfcUYnc3pzcInGwQit/gdgFRko/6NO5dGIcIm0RbzdouYC
         hkMSg2o5oFNVRf7i7C/TzM3PQtZCHpYQwDcSe1pKqu9YTb3Rsh1NccuXTDj2PRckoXoA
         sMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752511806; x=1753116606;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/lRA3Lmbx+WYHtJuKxkOr0j62kfUWW7KunEBa7xsiUM=;
        b=KYH7IoYvxYyjGOdjkbwS0XAdDE7pJTAJ/DOaZBUgX55exNQ5ObBis03L16M0q8cCqM
         veCrjqIq4CYxbOk4Yh2HHXoMJY+X6OnPuc9JV9LiwzVY1ZsRz84HJcfAU6i2zgo+0XoV
         /zsOjiBGerM0NMgsfFhrzkQTfjxbBSrQwsKicK2PU4tmUS/kwoQesHFHm0TmS4nuXgsA
         Q+SUljMcImKNNq3rQFa4BE+uNc3JL6O5A3LR0uTXLm18pPPo9Y7bYXOPKVjYZgriocUL
         un3Ny0DkAiRzjIEm6MT4M/IsSsjz7kzjxQx2+dLlZXNzF11sz9DcBdNYH9LjaTeo8nCK
         eBQw==
X-Forwarded-Encrypted: i=1; AJvYcCXpT6YISlEtXpemXINUQY/evMfgMS/yrwZtIDm4vMaJ5O56kS1SkUT757quGmr0JE/sucBP75mzeyT3@vger.kernel.org
X-Gm-Message-State: AOJu0Yww306GrffpHytetDOR0Mf2y4c+6M1KCudEUjfiUlnxpRgfgAoQ
	FANngLFPuPDc33qPt162zRG0pyvORse8ICsWk4Z976C80GlbJ0ebLrEwMy32O+0MFggSzTyhG6X
	lHTe5cQ==
X-Google-Smtp-Source: AGHT+IFrmqOWZv/+ru5luYuDmZgKFXLWqs4vM+qkel82s6TmdzUTtjhLo6c0sGKuG8MkQ3bXxpcIuMMTXL4=
X-Received: from pfwy25.prod.google.com ([2002:a05:6a00:1c99:b0:746:24d7:a6aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b70f:b0:748:e1e4:71ec
 with SMTP id d2e1a72fcca58-74ee2556e2bmr18728324b3a.12.1752511805750; Mon, 14
 Jul 2025 09:50:05 -0700 (PDT)
Date: Mon, 14 Jul 2025 09:50:04 -0700
In-Reply-To: <aHUe5HY4C2vungCd@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <935a82e3-f7ad-47d7-aaaf-f3d2b62ed768@amd.com> <F7AF073C-D630-45A3-8746-DE66B15FC3E1@sjtu.edu.cn>
 <aHUYwCNDWlsar3qk@google.com> <15D0C887-E17F-4432-8716-BF62EEE61B6B@sjtu.edu.cn>
 <aHUe5HY4C2vungCd@google.com>
Message-ID: <aHU1PGWwp9f6q8sk@google.com>
Subject: Re: [BUG] NULL pointer dereference in sev_writeback_caches during KVM
 SEV migration kselftest on AMD platform
From: Sean Christopherson <seanjc@google.com>
To: Zheyun Shen <szy0127@sjtu.edu.cn>
Cc: Srikanth Aithal <sraithal@amd.com>, linux-next@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jul 14, 2025, Sean Christopherson wrote:
> On Mon, Jul 14, 2025, Zheyun Shen wrote:
> I think this is the fix, testing now...
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 95668e84ab86..1476e877b2dc 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -1936,6 +1936,7 @@ static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
>         dst->enc_context_owner = src->enc_context_owner;
>         dst->es_active = src->es_active;
>         dst->vmsa_features = src->vmsa_features;
> +       memcpy(&dst->have_run_cpus, &src->have_run_cpus, sizeof(src->have_run_cpus));
>  
>         src->asid = 0;
>         src->active = false;
> @@ -1943,6 +1944,7 @@ static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
>         src->pages_locked = 0;
>         src->enc_context_owner = NULL;
>         src->es_active = false;
> +       memset(&src->have_run_cpus, 0, sizeof(src->have_run_cpus));
>  
>         list_cut_before(&dst->regions_list, &src->regions_list, &src->regions_list);

Gah, that's niether sufficient nor correct.  I was thinking KVM_VM_DEAD would guard
accesses to the bitmask, but that only handles the KVM_RUN path.  And we don't
want to skip the WBINVD when tearing down the source, because nothing guarantees
the destination has pinned all of the source's memory.

And conversely, I don't think KVM needs to copy over the mask itself.  If a CPU
was used for the source VM but not the destination VM, then it can only have
cached memory that was accessible to the source VM.  And a CPU that was run in
the source is also used by the destination is no different than a CPU that was
run in the destination only.

So as much as I want to avoid allocating another cpumask (ugh), it's the right
thing to do.  And practically speaking, I doubt many real world users of SEV will
be using MAXSMP, i.e. the allocations don't exist anyways.

Unless someone objects and/or has a better idea, I'll squash this:

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 95668e84ab86..e39726d258b8 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2072,6 +2072,17 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
        if (ret)
                goto out_source_vcpu;
 
+       /*
+        * Allocate a new have_run_cpus for the destination, i.e. don't copy
+        * the set of CPUs from the source.  If a CPU was used to run a vCPU in
+        * the source VM but is never used for the destination VM, then the CPU
+        * can only have cached memory that was accessible to the source VM.
+        */
+       if (!zalloc_cpumask_var(&dst_sev->have_run_cpus, GFP_KERNEL_ACCOUNT)) {
+               ret = -ENOMEM;
+               goto out_source_vcpu;
+       }
+
        sev_migrate_from(kvm, source_kvm);
        kvm_vm_dead(source_kvm);
        cg_cleanup_sev = src_sev;
@@ -2771,13 +2782,18 @@ int sev_vm_copy_enc_context_from(struct kvm *kvm, unsigned int source_fd)
                goto e_unlock;
        }
 
+       mirror_sev = to_kvm_sev_info(kvm);
+       if (!zalloc_cpumask_var(&mirror_sev->have_run_cpus, GFP_KERNEL_ACCOUNT)) {
+               ret = -ENOMEM;
+               goto e_unlock;
+       }
+
        /*
         * The mirror kvm holds an enc_context_owner ref so its asid can't
         * disappear until we're done with it
         */
        source_sev = to_kvm_sev_info(source_kvm);
        kvm_get_kvm(source_kvm);
-       mirror_sev = to_kvm_sev_info(kvm);
        list_add_tail(&mirror_sev->mirror_entry, &source_sev->mirror_vms);
 
        /* Set enc_context_owner and copy its encryption context over */

