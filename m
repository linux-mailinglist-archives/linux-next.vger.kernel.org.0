Return-Path: <linux-next+bounces-3611-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F86296D05D
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 09:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27CC81F23072
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 07:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E711925BE;
	Thu,  5 Sep 2024 07:27:15 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6BA83CC1;
	Thu,  5 Sep 2024 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521235; cv=none; b=lGClX+KmR01F2NZbo9yyVt3qfLqWC4NsJJxBtypnLm3UYvOX8VXSiO0y0F2+47wPk2NNMWTAGstDOXHG/ofV3NC4qxszh+gbFpHdGcYO0zQsX4JqVIuM+DZ1us9NUC3vYUPF7zr5cxYl0onISoMMLr/BRd4RF6WeIvsj4LALiOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521235; c=relaxed/simple;
	bh=BdUYCaUqAyqMdI0qwb8lVQTGEmCdhngFO7G2VLqZrNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ascTHebSptoV5tfGTP175RjDjXA4e0HOO48Nq5U+Q2LAw667HTK5kKZayIfi2pMiQfbPOO/4p48DuM72WKyH7RCv2kcHL5xcrqQu51K8IY6BrtgeSMWbXTbtKDgdX0VGtRVkePDc1OGC9pGLFoVMffcMROxDfJKF8nRhFUPmfjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-714226888dfso369780b3a.1;
        Thu, 05 Sep 2024 00:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725521233; x=1726126033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwNixpFRaGOFzJZ48mu9rffSw/yWpbWl+RpttX/sgFc=;
        b=gMclfJwBTtTdcLoVNEvvgPPoZoB7V8H+qYcTx6fjYJCMFIPFr5xYppzmfOP48x3Wwy
         rAxuo/AVDMUt5cd66BQS4uhwkFacoynb8+PbDIgjVSEqachmpPbJkTwSvkOhknOFTmNM
         KhZTzCZyXzXIVIzoKNzqy1ZunYldYwzG/984+S2w/n+incXkdwYcWZAEl1P2cMCc4wRE
         l94s1yM7ywloHDT9JrVG7TTbGOPAvmETGk5TXpAGRTZhn/OOOIOfhKoMGmL0xcRxfFVE
         aucaFYzdvnTh9zoTX8wzMTsIiHkkwrsGOCwJE3HIQbpiMQ1XYPtL+caQtvZnRC+Z0fW8
         xyJg==
X-Forwarded-Encrypted: i=1; AJvYcCULTWByZifZ21/2tTCXbC8dV7lfSSdF6sNhQ4ptEBmeDmeEHH+g27g4TECkRSh2cc6+gfugXSj3QTayhA==@vger.kernel.org, AJvYcCVDrIA3AzdV3uCrw8sMFjP9dLVTC3rQhc79c3zp+ura3yODr1ldx9TmSsLv2mBfbdv9nKGh+GgJ2nzK/7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0UphCOOujRVbIYp3JVNZx006lfhPhykeBDSnHbBId5+75nd5g
	GZVAbjA+nE7SCp5nHxllRcvAj90JXGpWQe+qcB2eHeyeAESuM7lA
X-Google-Smtp-Source: AGHT+IF314UW0kgEGrkeY4n3/fJtVv4DzP0+7f4M97uL9g9DwqrrEOtN8ERD8tLaboYqmeT9LwKffA==
X-Received: by 2002:a05:6a00:1acb:b0:70e:98e3:1aef with SMTP id d2e1a72fcca58-715dfc76335mr25537839b3a.29.1725521233302;
        Thu, 05 Sep 2024 00:27:13 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71791e54585sm329851b3a.182.2024.09.05.00.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 00:27:12 -0700 (PDT)
Date: Thu, 5 Sep 2024 16:27:10 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the devicetree tree
Message-ID: <20240905072710.GA1538040@rocinante>
References: <20240905164019.5086e9b1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905164019.5086e9b1@canb.auug.org.au>

Hello,

> The following commit is also in the pci tree as a different commit
> (but the same patch):
> 
>  80cfdfeb8367 ("dt-bindings: PCI: layerscape-pci: Fix property 'fsl,pcie-scfg' type")
> 
> This is commit
> 
>   f66b63ef10d6 ("dt-bindings: PCI: layerscape-pci: Change property 'fsl,pcie-scfg' type")
> 
> in the pci tree.

Rob took it some time ago into his tree as we were a bit slow, sadly.  Rob,
do you mind if we take it?  I would prefer our version given the updated
commit message, etc.

Sorry for troubles!

	Krzysztof

