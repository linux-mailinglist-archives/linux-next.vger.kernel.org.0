Return-Path: <linux-next+bounces-5455-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773E5A360D5
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 15:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5A9B3AB06B
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 14:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71F426656F;
	Fri, 14 Feb 2025 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EsdHNJMw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B6E266193
	for <linux-next@vger.kernel.org>; Fri, 14 Feb 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739544935; cv=none; b=Kk+MUFxU712JUoj+l7sO1rQ5aOXVlziQs8Ip5e18QXJF6+99PjYgbV88bHUbBDYN1o8LOcaOtF28sEIg9vVb/T4Omne+YkUpsaA877lDJHMZQL562CrQc5lAEquWgwex6V2qvsu/uhp968ACDhEYoLzQw7W2VoxTa0SMkVZKcbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739544935; c=relaxed/simple;
	bh=8kx1VFlmess5dQ9i4I0rwmdWx3wzpYasG80iI3G6lA4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YJ5x+TuQVfjgSTccXAW4P0Crzzn4AW2BMfv6SUyyExpo/RPuFDSd4/G0M48egTLuYVofLWLJx+ECi8ovtqsZqx81JZd29A81lmwFRVRvirlBBSmsj+GrYJWu+0UptmCdgMcUndMpK+RJmBcWT6pOm12fHUnip+lUwzCz2x7X0tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EsdHNJMw; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fc1e7efdffso5069052a91.0
        for <linux-next@vger.kernel.org>; Fri, 14 Feb 2025 06:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739544933; x=1740149733; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GpPnGA1SUNxnjKJ64nLgHnJi9RIPsBncDUL4C0Ugxio=;
        b=EsdHNJMwohFn7n4wZtHvrTzW889rFnoJIR3Co2XKmx7sTC06UrfGdPbeVdwe1ZFD9d
         Uo5f0zs1eMY6hCk7F7BXcCAPZBUnNR8gW06Kej3/+OAhb1guQjoZMJVYPShFoPUQFku8
         j/LX+I+ThZy3nod1TYSIEjBgMvAj6jCY5am2S/ycO+PRUsLxvadeRW0nv/Zl0u0pShoM
         u4p9pHu1qRQyM5o5yIHM8bUf7n9UEWhOWd/x3mynwVKtvHhzSrs9qiP4f2ycGTAm6hhU
         0OtMXf0pN2rxuN4BYlGJSaYWv3bVjhKy4h63AbGOqAN9chcn4ywGpux7c/PXx0ATybr/
         xv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739544933; x=1740149733;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpPnGA1SUNxnjKJ64nLgHnJi9RIPsBncDUL4C0Ugxio=;
        b=OtLdx7SgwtFmTrk4+r8OYdg4hp+FpzbrkPawjBRQgGNWeJbvua6eK+5OniTJuvzJHF
         ZtICFUjePOHSVEzpC5zIWWevOtOnGuTfD3Z+aUVn1/xHVKNQVd7h+4Wxqv0A4UGeoZFX
         jvjs3mk5fsFQva7IynAA7Q5vhhtz/B8iT0OvWrVRllxFU+GXF0kXqEMq/XiYpbhe5HDb
         nPlI59BcK4+OSTWt58KfVnU/Zi3psAiGRvNYVKGIx9NrcOkAHpQv7NzOUn9VVWWZSnsX
         cmiAQNzgv1IbAFA5K8XlxYj4LiDCZkB9C8AJ2UWY1xPT2yixBIijSAeoLxn2ksSBb2mi
         3xdg==
X-Forwarded-Encrypted: i=1; AJvYcCVO4jpAlqyS3nLRIt/rpOpW10+j9hw+t4CNpDX1JcKxkGl8yomvdmhbbY2zjyLb7dOocXdJaEtuPl+n@vger.kernel.org
X-Gm-Message-State: AOJu0Ywivzda+768F5Qe2o1x1Br8Ar/96k//oJLGMuF8SOCglsrnXU2q
	wYvx0zV8FfO8nB5yOpu3qu9+6Lgf+CG84aSQV1ksuYqnv7M9Bl9zzPGf0FGrX3Oo17sJZoJrea8
	2fw==
X-Google-Smtp-Source: AGHT+IHzORkSPizk80suRnQui11xIJEqPNA8t4h1ARtS6BoAsXHU0L9W7rjYxrJZycPngxHN3EC7bRyg5KA=
X-Received: from pjbta5.prod.google.com ([2002:a17:90b:4ec5:b0:2fa:284f:adb2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5307:b0:2fa:229f:d03a
 with SMTP id 98e67ed59e1d1-2fc0f09ebfdmr10097168a91.26.1739544933494; Fri, 14
 Feb 2025 06:55:33 -0800 (PST)
Date: Fri, 14 Feb 2025 06:55:32 -0800
In-Reply-To: <20250214181401.4e7dd91d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250214181401.4e7dd91d@canb.auug.org.au>
Message-ID: <Z69ZZI0Cxljc4qi4@google.com>
Subject: Re: linux-next: build warning after merge of the kvm-x86 tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Houghton <jthoughton@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 14, 2025, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm-x86 tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> virt/kvm/Kconfig:103:warning: config symbol defined without type
> 
> Introduced by commit
> 
>   5eec660014bf ("KVM: Allow lockless walk of SPTEs when handing aging mmu_notifier event")

Gah, obvious once you see it.   KVM_MMU_NOTIFIER_AGING_LOCKLESS steals the "bool"
from KVM_ELIDE_TLB_FLUSH_IF_YOUNG.  I'll fixup and force push.

Thanks Stephen!

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 54e959e7d68f..9356f4e4e255 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -102,6 +102,8 @@ config KVM_GENERIC_MMU_NOTIFIER
 
 config KVM_ELIDE_TLB_FLUSH_IF_YOUNG
        depends on KVM_GENERIC_MMU_NOTIFIER
+
+config KVM_MMU_NOTIFIER_AGING_LOCKLESS
        bool
 
 config KVM_GENERIC_MEMORY_ATTRIBUTES


