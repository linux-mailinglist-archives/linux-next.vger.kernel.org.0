Return-Path: <linux-next+bounces-8544-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CC2BB4E61
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 20:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 891C219E2DFF
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 18:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BD9279DD3;
	Thu,  2 Oct 2025 18:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BiEIH/OB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E39279346
	for <linux-next@vger.kernel.org>; Thu,  2 Oct 2025 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759430349; cv=none; b=lpMkgN3sBw9L/wcUil4Xu4NskXiiV0/Jx8SemzmSrgcrcpGPhE83dYbBDa/Y1fal0kkuFFbzOJ9S+CcFIae+QD4gKMNVUhR81MYnPp0dtBaiI7vOUD6s9TFbF+c5LmohbNYbonUflHpXRhDqk6q4aBiijnkEsrihNYPfvOmmTPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759430349; c=relaxed/simple;
	bh=G09Kpo4xTPUVEiyG22AAm1ZAbiJJ+0YFliGitufaR1g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dJ/2qTULV5LPmHNSFuGZ85YuUnmOEk5ofFgOhbkOgtFEGOX68O2vVOXsxhB2NxTVWTfUGoJZ1mpypP6iCpf88MNgJUaAD7PTpddkYRv5FICEv862SXqmw63PG3CEHMRff1cB2LxxmQhP9zcnHO1fVHvbzLXQPbFC5w4T5eCvw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BiEIH/OB; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so1351297a91.2
        for <linux-next@vger.kernel.org>; Thu, 02 Oct 2025 11:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759430346; x=1760035146; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=duEE5S2daxBtDzrQtu0r5VIf4FyGlLEemzqCmyOwWzI=;
        b=BiEIH/OBSrVZYDvsKyOSgTxnTSgN8HZTuT5R6BMusTMVgJkQICuztelM0x1mgaTt4A
         /tfRkr8W/HA9Imf0ThUw7fELjzpyxyLdYaRAy6n1IUCBgmEhkw/Ge1q/FvmN/HOLLzhL
         T+liuJl8ZlnCCaI7rFQ6OwtsacD+Uz9VR1rIjTHoeMAI9n4v+79ZA4cUz0Z0KiBgkrlK
         K801K2RjdXYAl4mifr0OnaJ/h+IkzHfWTy7rQ3uUZYLWj82XHUywOh7KRfEB3TTL+oeT
         nitF7UIWLXo+0v73y9UV9ecol+MAqUqNJaW9uuBuS1j0bwiqM7ilQv36k9JlIKqf8DgK
         1gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759430346; x=1760035146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duEE5S2daxBtDzrQtu0r5VIf4FyGlLEemzqCmyOwWzI=;
        b=Crrb7nUlEV4rR8mWQBx0ys0ZqX3gJbPPdK8KC2YDugsL1EDL+iqJWv6eRPQn8rB4K2
         B6dxEB+Nxd5QlmKqT29E/F/CXyXSs716P5XajkTxVM/uFbNl+sjOjk6ZbvK8ln0QPZDo
         qHiKUU9K8z47NOig4KlImJalimSBYVAOVvFSwt//kgMSRSvywzKxdRv7/DVeYa8mDiHK
         yqaorfpuRjtCjCDQTW52qux2G6QbLDzD0r16Q42S2TCVAhoUckyLtC+UXVyvcKai/uBE
         DKzGyhNsuZwwyw9z01AVhNct8jHI6ZFuWHopZYuKxtwPHqYhaw/06itZXVAZ9U4aPrJp
         gzGA==
X-Forwarded-Encrypted: i=1; AJvYcCUKXq4Lyvy3UUoiDhv+zJl6bLFBTBtupOsd03L8eDeZGTQYtmBvSqichAfJStEzW5oAK6HrUeD2GO7/@vger.kernel.org
X-Gm-Message-State: AOJu0YzEPJkMAVIjbSw8DQvGmVjkDWOmBBlbTDYjfeEE4CAHSnVnOVzu
	kdlwbEmwMLn2UVeL53JB5KN27ifd3b0BKJZ8X2fjBQr9G8taT3o++RejmdweUShjCyPdZfN7KRX
	zuAgFiA==
X-Google-Smtp-Source: AGHT+IEFL9bqgbP8tD63/vZT6rn/5qVLAEV3U7x2zSmWmIO2mCnwPRYoP1fhIFqrQuodI6f+gnNPUZpWXpc=
X-Received: from pjbgb10.prod.google.com ([2002:a17:90b:60a:b0:325:220a:dd41])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1642:b0:32d:601d:f718
 with SMTP id 98e67ed59e1d1-339c27d3eacmr345300a91.31.1759430346442; Thu, 02
 Oct 2025 11:39:06 -0700 (PDT)
Date: Thu, 2 Oct 2025 11:39:05 -0700
In-Reply-To: <aN6hwNUa3Kh08yog@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aN6hwNUa3Kh08yog@sirena.org.uk>
Message-ID: <aN7GyQU6q8fKsJ7J@google.com>
Subject: Re: linux-next: manual merge of the kvm tree with the origin tree
From: Sean Christopherson <seanjc@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, KVM <kvm@vger.kernel.org>, 
	Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Xin Li <xin@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 02, 2025, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm tree got a conflict in:
> 
>   arch/x86/include/asm/cpufeatures.h
> 
> between commit:
> 
>   e19c06219985f ("x86/cpufeatures: Add support for Assignable Bandwidth Monitoring Counters (ABMC)")
> 
> from the origin tree and commit:
> 
>   3c7cb84145336 ("x86/cpufeatures: Add a CPU feature bit for MSR immediate form instructions")
> 
> from the kvm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc arch/x86/include/asm/cpufeatures.h
> index b2a562217d3ff,f1a9f40622cdc..0000000000000
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@@ -496,7 -497,7 +497,8 @@@
>   #define X86_FEATURE_TSA_L1_NO		(21*32+12) /* AMD CPU not vulnerable to TSA-L1 */
>   #define X86_FEATURE_CLEAR_CPU_BUF_VM	(21*32+13) /* Clear CPU buffers using VERW before VMRUN */
>   #define X86_FEATURE_IBPB_EXIT_TO_USER	(21*32+14) /* Use IBPB on exit-to-userspace, see VMSCAPE bug */
>  -#define X86_FEATURE_MSR_IMM		(21*32+15) /* MSR immediate form instructions */
>  +#define X86_FEATURE_ABMC		(21*32+15) /* Assignable Bandwidth Monitoring Counters */
> ++#define X86_FEATURE_MSR_IMM		(21*32+16) /* MSR immediate form instructions */

Just in case anyone else is starled by the change in bit number, these are
synthetic (or scattered) flags, i.e. the the bit number is arbitrary and not
tied to hardware.

