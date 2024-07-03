Return-Path: <linux-next+bounces-2816-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D482D924CFA
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 03:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EF60281E81
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 01:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E9565C;
	Wed,  3 Jul 2024 01:03:36 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5ED621;
	Wed,  3 Jul 2024 01:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719968616; cv=none; b=eGjBhlcw4cs4v9RDg7IkTyUJuyL5HzCHV0S44J3ZgvkcM5i8mDmXQh00Kgq0Ul/5lsMga2F2YoWCdiJdmdhyeFOWXWPN/lS2GJMko4eD/HMpnf6zHBvRsE8fP8uUpnTAlfXj2stn5vQ2R3+McbsXgbIlLdfip8U4BLvRb9AKl9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719968616; c=relaxed/simple;
	bh=7e9SsKzfSM366TjWrAlHka5sUepJObo6LLumeDqksk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AePXTjQzMTHc8gLVbyrE/aMTQjoiXLgzhCuRpVFpQ9g11gPYGs4xzW7H0ts6U71LysAA64/LevdPHUyBg7YlENBiKs9plNtFNlfn0ikL8cysZT9PEXCdjMx5rjyOWi9Uzrvy7KHGJYsamJ6VyMoTRS9ygJQ2OXDB8Xbrz0IUlWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-656d8b346d2so2887112a12.2;
        Tue, 02 Jul 2024 18:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719968614; x=1720573414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4xI5Q+oGJGz5nsSovrUlg8gGo+ekUKOgKzvPPkYcDw=;
        b=rVx/ti0aAEi9ab2DLvwr44FLn0HmtJ9k1NxVM5D6bB5gXF9xJtOEIjRyvZJAx+DLqv
         FaK7HWqfMrW4Ble04fq7F8LNR/DjBeprbFpgewFLOg9bodOYGPCmR2JAL+LC1xaPEh+p
         890zwViCQ1VG+wE1mQwADuH05FsR1+Qg0oSN40qxeLFKiv8r4xEzI+mpjSmaHGT1NULo
         /v0tXkOpfI5dHdJnn2Xp51VOHG1eltbcAjrZ+WK6DzNObd4e6o+5zOQq2qKaRmdfvDnB
         w2fhfD8KTu/P2FZh+ovpg8R1sRulF7Dza5kXtPEkGdJ9/UCNp9N8pKbXS/g1bCNyyYpC
         cTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs8cdQ8yDdMH1bSNivL9IsV6nFLx8Qej08tV80RTzeTsUM53I5O89VdN7e2S5FdElBE8mh0JUoQoBsJc2lCj4TeKU6TYAUp0VQ9ftKL1ShPAE785TOJP95IlGVdhOqiSQi/VEFv4ZuHg==
X-Gm-Message-State: AOJu0YzV9dNHVf5EPJhMG06E+7GfqXfqUwJqRaIdeRRdF1vT+ngE9r8f
	CIsBswQtOq2RZThSYJbZrpnXBwfy6z5rURyjv3hplSUUIHzqmSyG
X-Google-Smtp-Source: AGHT+IFk54s5SdkQZ1FAG8+B5HUSZUrstTfy4g5PxxS5qF23LI5sCJ7gz8dXuEnlhzxIKBb/bIVnyw==
X-Received: by 2002:a05:6a20:4303:b0:1be:2e11:ab28 with SMTP id adf61e73a8af0-1bef60e3affmr10156692637.5.1719968614188;
        Tue, 02 Jul 2024 18:03:34 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1568dd9sm90546935ad.182.2024.07.02.18.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 18:03:33 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:03:32 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <20240703010332.GB3160262@rocinante>
References: <20240701130108.63628d9f@canb.auug.org.au>
 <20240701201942.GC272504@rocinante>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701201942.GC272504@rocinante>

Hello,

> > After merging the pci tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > drivers/pci/controller/dwc/pcie-designware-ep.c:818:6: error: redefinition of 'dw_pcie_ep_linkup'
> >   818 | void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> >       |      ^~~~~~~~~~~~~~~~~
> > drivers/pci/controller/dwc/pcie-designware-ep.c:22:6: note: previous definition of 'dw_pcie_ep_linkup' with type 'void(struct dw_pcie_ep *)'
> >    22 | void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> >       |      ^~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   9eba2f70362f ("PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper")
> > 
> > possibly because of an interaction with commit
> > 
> >   3d2e425263e2 ("PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event")
> 
> I will look into this shortly...

Hopefully, should be fixed now.  Thank you!

	Krzysztof

