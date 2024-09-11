Return-Path: <linux-next+bounces-3761-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CCD9755C4
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 16:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D023128B743
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 14:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2387319259F;
	Wed, 11 Sep 2024 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="odhwWcw0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865961A3052
	for <linux-next@vger.kernel.org>; Wed, 11 Sep 2024 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065558; cv=none; b=Zjei4SKC046/TUrhTYd6jA/gFl9d5/aLJdDNBgGvXkGSNy2ugRjRRV4qHV8LecIXR1IjKqzDFoOU2q5495HQxY3lUYeWu8IIysUtXki7g8zeq9zUQZQIBkSzHiBgNoY/0O7+RgpJQUweW5y92Wc4DMuwPWNox8KHGsO2pK7+Wrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065558; c=relaxed/simple;
	bh=w+cR6+El7pqymgvTvcDumh1q8dbGf9jWi7bmfr8+Pvg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tcoyy0B4EnoElNWy8Dzq1d04vT9g7WeSfYoShO7Y8m+X2wj7NVC/5cw38Kw0sc7XrqgBCXQpF9rHe4FeRIhudRy3KJkRZqyVogr4PxSVJSiKJMFMgt4nB/HEGicz/cI4gndqJzybXA4rE6Obo0AOVplytSRftlkCVWvffQVSELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=odhwWcw0; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d4b832fb63so224675707b3.2
        for <linux-next@vger.kernel.org>; Wed, 11 Sep 2024 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726065555; x=1726670355; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KRS2EqIj41lUCa2DwfWJx0AGrSuakq62cQAUHPjwAcs=;
        b=odhwWcw09F2yMD86XWS+i6LzHSFJnwa+eguUdzTpWj5tO/Qp0CcCgu1XooAw1LiuVc
         ZP7hwtnrtAyttUwsddp22CslY2/uK9FoAPr/W374UVs9cZpRNDWHGzhXX2RPlLwyuil1
         A6DqI9Uro9xKT3WbhZBNcWy8sMKAz1924lSvZ43vdPjBXqb2pOgZoT04GhAGNXctogSU
         koHZdKWhV6xEHT/qyo791DXTrp/r/P9PEK1TbRfSFpkPz7Cc5kMdN2ooi5IlcQlTmLvr
         ijAS67V9g6qT33396BpIdYZzzQpZeP/VhxwhVsqVN2vx+GImCfBBiJG1y6tXOU2SCtmc
         nOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065555; x=1726670355;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KRS2EqIj41lUCa2DwfWJx0AGrSuakq62cQAUHPjwAcs=;
        b=sqgBT6n+f7OUh9Xq71oL8J44/OXXiMmL1728Wc6FuAnpQKyu+vjznDRz3eC2d1t8He
         IQrpF4YFasuSBc7uOg24onJ0onoSt5XDEMZIohN1G+mHFV+0OgEIYKoBpDt92ABflV/r
         Cbq6CNJz/v18ctKS1W/Aqsv8ej0/ErkpZUUoKxb8d0nW+lzSQCurwxF2U0cV2aEeq2RI
         7F7iug5NjeFUyaxQHXWKPef/9yedBsNhzU8GTpgW95VknDTzMmK2QMJMBukXG63HkzWL
         xoV7gP0XVn4OENWJVqPPQS/69gjAuycTzyGxlgOWMZXuhQHQt0YcRDH6Siuggd1LUI4n
         216A==
X-Forwarded-Encrypted: i=1; AJvYcCWDI+wg7RUQ+SmHJl5F8ejBj7rde8ipkeFy/soaDVs94urc1C3L+HzdV4bNb1h4EzPFCplRnNbyiIde@vger.kernel.org
X-Gm-Message-State: AOJu0YxMR8otdbtud9oLpFMOHuQyool+Wc85tuMGOmCM3vFOZNCleYQr
	PUBJJ7h0PZwYN/Yj7MOFX09MgrPIu5FKcm6OhMhBSQ37jrEp2ZlOKdLPcxNWAHJlNeR/GeVu3nT
	D8A==
X-Google-Smtp-Source: AGHT+IFVyQPF8pUNfEauUCtlIvJXdL6Wqa8cZN71thCsgn84UzyBYJoUBSMJQ8C2d9HG+i/lEn5gguvdMJs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:3601:b0:6d7:37b9:ac93 with SMTP id
 00721157ae682-6db45168382mr11415147b3.5.1726065555623; Wed, 11 Sep 2024
 07:39:15 -0700 (PDT)
Date: Wed, 11 Sep 2024 07:39:14 -0700
In-Reply-To: <20240911154328.0ad45c38@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240911154328.0ad45c38@canb.auug.org.au>
Message-ID: <ZuGrkqwbBt2V0dJL@google.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm6390 tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Christoph Schlameuss <schlameuss@linux.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 11, 2024, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
> 
>   tools/testing/selftests/kvm/.gitignore
> 
> between commit:
> 
>   011901fc2224 ("selftests: kvm: s390: Add s390x ucontrol test suite with hpage test")
> 
> from the kvm6390 tree and commit:
> 
>   9d15171f39f0 ("KVM: selftests: Explicitly include committed one-off assets in .gitignore")
> 
> from the kvm-x86 tree.
> 
> I fixed it up (the latter includes the former) and can carry the fix as

Ya, I'll make sure to note this in my pull request to Paolo, but I don't think
there's anything else to be done at this time.

Thanks Stephen!

> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

