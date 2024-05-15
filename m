Return-Path: <linux-next+bounces-2321-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EA88C690A
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 16:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 527EAB20DC2
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 14:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE4B155730;
	Wed, 15 May 2024 14:54:59 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E4E57CA1;
	Wed, 15 May 2024 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715784899; cv=none; b=qdIuQSxakmufNkiyr7ujLWDVZT/eBup5MHopjefR6S+0D0K+kC7t+Jc3LAme1itNQ3c9OzLtJ9M2flR0v2OIU8Lk+/puwn44DmrS3JBkva20IH6ajtSL6Sq9X07qru89zETGWMzECHiykKzpmxII5eq42XOyQN4Y8z8gb89Tf+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715784899; c=relaxed/simple;
	bh=7h+eJn9RfFs8BvC0zjKNNrqeaEUinf5Jh7/f4IWxoyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+Jxb4fQV3GCqdMxcw3jb0ewsii2LM25/icls/ZGF3tFfdOizLhGh+tz9ve/WCqKPGm+BazmMloTPL0F3rBQOPr9ZkswsYlndQa6jtfKC3b19gjfr+CiSL67UcewXBcii9QN+/cLxPiP2Ew2gmaoKo//FDPKmPUux/gsUUjp8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ec41d82b8bso66138305ad.2;
        Wed, 15 May 2024 07:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715784897; x=1716389697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+UOpMDxR67S/h1EUs/8J0aREEMlbRT3PXTyUY76YUs=;
        b=MoZLATPlK+pCulQBZcyO/IOV5c2sqjvNy0Ygs/NL/xHeyaLriY1HgqVYQryjfhq7Yj
         8ZsukpUCq7Euu5/dMLOyTWWmdFnvEDA6BA3+NGfebYvNiVDL7cY11mce9rIqKqVhiXKh
         FYxAeJCk9GsX9xTyp5Fpi2i+bYnJ/w22J5xIXJXzFRiguM4M0bqXKBATQkjjt40JAB4N
         mdUNdUrJRQAsMevxUV4YSQrJlTezU2zgEvk7w0ClYisLjYvi8M2YB5tYGwWbBqVNxsr8
         93hMyHKgfxewoH4f6ahi4i+R7DUCvzGAcpDngXuGm38YUDkwYOcnA7aXoPJSv9GB35iS
         6ipw==
X-Forwarded-Encrypted: i=1; AJvYcCURgeeSYQUmp6DoT2L5PFURK9GtY24dqDjxigkBIv8aRplXolkq4e8+tXrLSGlD6+kFh2VoLsBsCCdw/RDL+yn1T307mvjrwty+ERGjyVIIcjg6wUSWX0dwc9DKQP8WhO9tbhpgsi8Baw==
X-Gm-Message-State: AOJu0YzSI3SuXv0GmQW/lQ6XYYnuRnvaC3XPTkV0loX3pD6sU2hcJuR4
	kLTxtxH2u+kP+ocbVFN4BY86IvyW/33q8rwqEaB7AgvpLzqINlLlGeMILUQk
X-Google-Smtp-Source: AGHT+IHirmLa9yE5QDMX5U+ETxvGe8xQ1Li5vHnVpP4mSaOyK/qbPXmCuv+rSm+zXnj8wmOrG9nA1A==
X-Received: by 2002:a17:902:ba8a:b0:1eb:acff:63bf with SMTP id d9443c01a7336-1ef43e26591mr145272785ad.37.1715784896809;
        Wed, 15 May 2024 07:54:56 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c03700esm119092555ad.217.2024.05.15.07.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 07:54:56 -0700 (PDT)
Date: Wed, 15 May 2024 23:54:54 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Rob Herring <robh@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the devicetree tree
Message-ID: <20240515145454.GA823444@rocinante>
References: <20240515130139.2da899c0@canb.auug.org.au>
 <20240515135008.GA450088@rocinante>
 <CAL_Jsq+1bYtSm_eTAo9q+ZS3ZzODbnkiCRNa6tOLU5HPUfny8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+1bYtSm_eTAo9q+ZS3ZzODbnkiCRNa6tOLU5HPUfny8g@mail.gmail.com>

Hello,

> > > The following commits are also in the pci tree as different commits
> > > (but the same patches):
> > >
> > >   15be4f7ce5de ("dt-bindings: Drop unnecessary quotes on keys")
> > >   28081ebd17fb ("dt-bindings: PCI: qcom,pcie-sm8350: Drop redundant 'oneOf' sub-schema")
> > >   649bad67d4b1 ("dt-bindings: PCI: microchip: increase number of items in ranges property")
> > >
> > > These are commits
> > >
> > >   d7890a80e037 ("dt-bindings: Drop unnecessary quotes on keys")
> > >   301e978b9eb7 ("dt-bindings: PCI: qcom,pcie-sm8350: Drop redundant 'oneOf' sub-schema")
> > >   247edade4b4b ("dt-bindings: PCI: microchip: Increase number of items in ranges property")
> > >
> > > in the pci tree.
> >
> > I took the last two, and dropped the first one, per feedback from Rob.
> 
> Normally, that's what should have happened was my feedback. That's not
> what we should do here. What you've done means we *both* have to
> rebase our branches. Since we're in the merge window and I've had
> these commits in my tree for over a week, I think you should drop all
> 3.

Done.  Thank you!

> I only picked up the PCI ones because they hadn't been picked up in
> over 2 weeks and the merge window was approaching. What's going to
> Linus should be in linux-next before the merge window opens. We're all
> guilty of bending the rules there, but that should be the exception.

I will pay a much closer attention to DT patches from now on, so I can
track things better, and pick things sooner.

	Krzysztof

