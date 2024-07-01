Return-Path: <linux-next+bounces-2779-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A253691E97B
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 22:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D019283DD0
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 20:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270C016DC09;
	Mon,  1 Jul 2024 20:19:46 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093316F85A;
	Mon,  1 Jul 2024 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719865186; cv=none; b=VfNfmq3vUur3W1uhFdR9Ln/TKo7GySE/ce3x/5OdRFE0bxYiq+R79HviyFnz4JeQ2HWfjQtz4eEuY2D2ap/cPxhM+kaWsolHbvyATazjN1nkXOi42VNmAulWHuY+LgDbIzhXE85qpM5mmMVtu74/kTgWKs07SZutwkhdHdMyfn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719865186; c=relaxed/simple;
	bh=gtILim/HJ+ujvf7/kOaItzXfFZ51HgQjkvh01fOIx50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUyZ5D/+cJr08OHh+WsLFpEifx4NbKk1EBYDg/ujE9i6yhag+5/BOFQb9if1oReCrQX3T+BYUMl9r+brixog8uqXrLnfFnSexzjWkZXMX5ikUXuJNuwBUToCldCDl1HL4elaioLbl27GUJ6SDzIUHWvTAWvjFMLlV9rBks92T5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c9357a2647so1679981a91.0;
        Mon, 01 Jul 2024 13:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719865184; x=1720469984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7CPC45a6z8Ol07078t1kucZHx8bYtcfgFOovH1ePZg=;
        b=sHMM4qb2L9q17hRCcG3WAL+MQB1qr/NWFTQvdv7mo2TNFl6rRWZm4Vfnk5IQ+AO0GR
         awaMLC6+Mj7YMX/JHIrtC3E5WT4WnTrKbVrWxLD4QV55R0ZO02UhCiMOul7w7fuDNVi4
         ZEVanwKmclfM6zApPr8N8+5shJxkFziKGWjw62L7zDnTNuuaX9nwBGg9pU7qZ9nv5iTn
         py7eiyG3xs5GCIMtOGWDIe24h9mPElKZnrqwtYVMtaj7v6rK3MDGp9ATyLX+UyQ/ko2Z
         NM8x77uomB3cydxgLBAIKtq6DGvAi96N+kF4EKzFPvyxZj/ueVrl1+Ni0SRYf9nk+OQm
         j84A==
X-Forwarded-Encrypted: i=1; AJvYcCUDmyHZzuSMLppxOTjqTDyCgk+14SR0kpWUNolru9dIs8F7Om8sN7B/XxVcSv2AZ70cDs5kxuL5I3gb8ec5X5Q95vLVcUSr2MZkg1T3HgpEUrGEnC+GqOCg9/C9Fz5rOnB8hXdxc9gLtA==
X-Gm-Message-State: AOJu0YyhLzOU2p+5suzA4FtWmhQvT4Vk+VjM7xvvHrdG8HNRfDiGNrX7
	SEuhpTOVGCZhgKtMIc3jBya+BDDBNeBpd0hFqowpa0Q33Sx3eol6
X-Google-Smtp-Source: AGHT+IEJEbvlzvQOFT4pgucYd/khgtZxyiVbBGWZVUo+7PnVlJPOOL5Ta86DrxUKO5kNZN2yrkZx6w==
X-Received: by 2002:a17:90a:dc09:b0:2c7:35f6:87e5 with SMTP id 98e67ed59e1d1-2c93d6ea810mr3583915a91.5.1719865183953;
        Mon, 01 Jul 2024 13:19:43 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c9270c121fsm6882502a91.11.2024.07.01.13.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:19:43 -0700 (PDT)
Date: Tue, 2 Jul 2024 05:19:42 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <20240701201942.GC272504@rocinante>
References: <20240701130108.63628d9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701130108.63628d9f@canb.auug.org.au>

Hello,

> After merging the pci tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/pci/controller/dwc/pcie-designware-ep.c:818:6: error: redefinition of 'dw_pcie_ep_linkup'
>   818 | void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>       |      ^~~~~~~~~~~~~~~~~
> drivers/pci/controller/dwc/pcie-designware-ep.c:22:6: note: previous definition of 'dw_pcie_ep_linkup' with type 'void(struct dw_pcie_ep *)'
>    22 | void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>       |      ^~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   9eba2f70362f ("PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper")
> 
> possibly because of an interaction with commit
> 
>   3d2e425263e2 ("PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event")

I will look into this shortly...
 
> I have used the pci tree from next-20240628 for today.

Got it.  Makes sense, thank you!

	Krzysztof

