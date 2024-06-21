Return-Path: <linux-next+bounces-2639-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E219130CC
	for <lists+linux-next@lfdr.de>; Sat, 22 Jun 2024 01:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB1031C212FC
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 23:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B9A16F26C;
	Fri, 21 Jun 2024 23:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VEshpCmv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A016916F0E1
	for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719011400; cv=none; b=r+6BrTVm2ifLkJQNnXsr/2oCa66WNdbhmiEXuHv18RUgNN7eSCHA5vl+AS7Du1qJwEDZ9fAEfZRGf5vfgmL7e9gKN+eIS+1OQTgfj4UMQl1xgC2Slbvj5lD1DYSjlUftIpS5oIMEKSrBjEP+Q+9uur8GStbRmp0VgrO2CnmEECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719011400; c=relaxed/simple;
	bh=J6CtqUdJBpJR6hj8JzbSvf5qexLGlK3syUfxf69EVdE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jMummKGv1bMbZpPmVuFtJ497gK2YokXKGUygbSPdR4+fAnt34h5Q0ySBd/rO8+WafagHsahNdnp5v8kuCUw7ahbgDeCJgr6MgtJqkvsPAJ1BVDqDPnlha1Yj+ZF8r9RcJrLFZtU0mDf/6Eqa7wEiZHpnz140eG3U1YkF+XFLOgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VEshpCmv; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e02b7adfb95so4683219276.2
        for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 16:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719011397; x=1719616197; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hZ+cfUgT+aBmHL3C3Umw6E7c9yi7lplkG1zz9za8pkI=;
        b=VEshpCmv5DqHGb6EKfATG27cyO+3uaghCI41qF1osvq209/TIxJzKJo8d1ayJP8V5u
         Mt4tvHPIt6Ke1XL5/9QhjqqcpeJjAp0RgEYCFJzAzmXmxqEKnbzPPcuGpCeGL6DFPzYD
         yvxFRQA8+i++/TIcakC3fAQo8+Ba50WKp44T6Gq0goaW2CAAfBFiodh9oAuySI1Jez67
         T0qMAfuX2gmJKXAz8bJEweCON+bZkDOkXbZDpHy+J9ktZdkftf/YFdVWQA2oVeYNvkVh
         uaa2YaT1MVNar6IfQ0QkI+6YHm43/Qe4oXkxrTJAr/FPK/0dIrTWCyV8qRKZFtSp4jI+
         DokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719011397; x=1719616197;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZ+cfUgT+aBmHL3C3Umw6E7c9yi7lplkG1zz9za8pkI=;
        b=VVHPiwf8ewJL+WCDjRn/K3OGeVtzby7SDFnlqYt/NL8qIvx24isG8C6PKX9ThTMoVW
         k7DavRLF4FuFIIV7TwtCDostCOJ5F+1qXj9b90WfzvaYuaTEkB8mte93E6LuAyA9Rbzc
         KHOQUnI43RVfgct0DK8Kd6/8ku1Py/CE+Kbkpux2brJsjt2rIbuNvq+uPeHFT0YcCWCt
         5XZGH5tnQ+kuXmDwZjhY0OxhRjHeAsbtpTwvunesLekj6rj8pC1DkRtFsD8NG4GOQVao
         vBHsnrYosUEq0GuUSCpTlS8l8AmyFuPOuG1pBKKT5KDau9iabu5rxrpzOHgaeVa+8Q0A
         5NDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAsAKGufA0gyRiAADFptqG+oc6LHbfSLzJcpgoj/Yt05UqVQwI7/YziQh+RvyQSwLZIme0yafPTblRFagNw51RUPTWAkecGySlSA==
X-Gm-Message-State: AOJu0YzJTIx/8FWQivJuuNACeS7uJBo2rt8XiEUahIpplNsJAPsVd1J1
	Fb1sGHsnFo+okLiXPof5bUHolmqyMTyDayOS8Om16juRMPTZQ3XzvxCyG3JX7YlLHJhUw+8QIfV
	+oQ==
X-Google-Smtp-Source: AGHT+IFCunyip/osVKd1aijWizOlNFOoetomMC7RpdXuhtX9ZSat09KiYIr/FEpK+cRnSEvH2xqfvh70e1A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2e89:b0:dfb:fb2:ebe with SMTP id
 3f1490d57ef6-e02be247c59mr869834276.13.1719011397487; Fri, 21 Jun 2024
 16:09:57 -0700 (PDT)
Date: Fri, 21 Jun 2024 16:09:55 -0700
In-Reply-To: <ZnW2kD1V0EoViS7i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ZnW2kD1V0EoViS7i@sirena.org.uk>
Message-ID: <ZnYIQ9swzOjU1DuU@google.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the origin tree
From: Sean Christopherson <seanjc@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Wei Wang <wei.w.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 21, 2024, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
> 
>   arch/x86/kvm/x86.c
> 
> between commit:
> 
>   f3ced000a2df5 ("KVM: x86: Always sync PIR to IRR prior to scanning I/O APIC routes")
> 
> from the origin tree and commit:
> 
>   aebed32e4985a ("KVM: x86: Introduce kvm_x86_call() to simplify static calls of kvm_x86_ops")
> 
> from the kvm-x86 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the heads up!  This (and possibily similar conflicts in the future)
is expected.  I'll rebase kvm-x86/static_calls next week to resolve the conflict
in kvm-x86/next.

