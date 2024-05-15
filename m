Return-Path: <linux-next+bounces-2319-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DE58C67C7
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 15:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D7CB1C219AC
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 13:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7854213EFEC;
	Wed, 15 May 2024 13:53:09 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138B18615E;
	Wed, 15 May 2024 13:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781189; cv=none; b=iANcBX0YcwTjbfKZvYYLyJYyy67/l1LroesTOYpF3FA9GiSDDQQYOJTNMlcthjxsld23sjxtX0eWtT0YRRFF9GBGDV3aeqbiqEmmlK0y25qSKpqBnxmM4Wcbmiz1Y3FVk6j7IT8jvgBrAEGXKY/UPb7e4tbQfPKvnug4/T/ygqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781189; c=relaxed/simple;
	bh=2RhA4AJr7Ms2oIPMsFtTgWfiZTeZWm8zSwVI0yZWn4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWaUR/4iz7/N/B5b4UXaiquoYnVoLNVAdE5gb/Ssx0eaTRrrk3jv6K/eeHVOVYOKr6kmCxOQDUWVMC2yIki6uCFw4sR/iBtX44ArmfUdvRPgCiXJDJ81sAuQw4gwR00GOO9R6foriLsUkdj5hSzgAL7K1kuuWgiXp8m/HrAqwGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f44b5e7f07so5630996b3a.2;
        Wed, 15 May 2024 06:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715781187; x=1716385987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZK7Dr37YrKnYe8S1LBwbZvZdFU+m7d5y3VOROlZ5WM=;
        b=b4Qqvy8ou7Iql6dMqCyuv0LFUa8qC+Pum3FKzShnIjNib4C5oQ+pgzcxCT5UntzhmC
         ynnL5AGrlX5zt9DhAUworro6P3YciodQeevGDKT/5fLYOfq7UdCFgdtF9Tfz4WqWKJcD
         JQKvqc9n1wUeb47iw/+mt2DhD376TpFdYLpDPR1ce6DTgmb7DHBsGUF2TPmEUDfKeHbC
         VR3C4GT3i8spnBYfDzZ+iHGwIfKqrYvmlfL/4qa1gHUZBijK4aCX5Tf9xBMXdbqek11p
         wxp4QftmimlRN9g7Dl3wg6sM1WKHvKuiBIeNC62rKOaja0RG/mfv7jXwKoqhIPIzT6ub
         +5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW84KeCPYzk8QFjTOUu84bJVYjjfkMuaY+bYhO7qD86awBtnHhWvTrXcJi7CZy7FRoqLM7116i/dVDxY+rwhqZh+PeOtHXdV10K2MwGGLzq2rnUHUSqgTW2Q9orFHfkrhS0eNGqIWCImQ==
X-Gm-Message-State: AOJu0Yy9LS5OtCgLkaG6nxvlDzWpXpZAKQtaVRE/vLb73Y9PyVkB/O+P
	4BWMUEgQjHRYvaeVKoIW5XV24kKMgOcrTIZRt3HkZ+VqwxMkGm8B
X-Google-Smtp-Source: AGHT+IEAJn6JHEz+/HXzS7vA1CLvfUxBmAIVbnjFHvq7H8diuHRFpqUwTQF/PG7peIP5QKdk8//vIg==
X-Received: by 2002:a17:90b:ec8:b0:2b6:c4d8:145 with SMTP id 98e67ed59e1d1-2b6cc77803dmr12872343a91.20.1715781187210;
        Wed, 15 May 2024 06:53:07 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62886b608sm13545803a91.27.2024.05.15.06.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:53:06 -0700 (PDT)
Date: Wed, 15 May 2024 22:53:05 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the pci tree
Message-ID: <20240515135305.GB450088@rocinante>
References: <20240514-nerd-acclaim-04cf23e62926@spud>
 <20240514232746.GA2089475@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514232746.GA2089475@bhelgaas>

Hello,

> > > The following commits are also in Linus Torvalds' tree as different
> > > commits (but the same patches):
> > > 
> > >   8b77e887b96c ("dt-bindings: gpio: mpfs: Add coreGPIO support")
> > >   8c24b6f1709f ("dt-bindings: gpio: mpfs: Allow gpio-line-names")
> > 
> > Neither of these, nor commit ff26bed00278 ("dt-bindings: riscv:
> > microchip: Document beaglev-fire") should be in the PCI tree really.
> > 
> > ff26bed00278 ("dt-bindings: riscv: microchip: Document beaglev-fire")
> > I don't mind if the PCI tree takes though, I didn't apply it for this
> > cycle so there shouldn't be a clash there.
> 
> Hmmm, yeah.  I think we should drop these from the PCI tree:
> 
>   ff26bed00278 ("dt-bindings: riscv: microchip: Document beaglev-fire")
>   8b77e887b96c ("dt-bindings: gpio: mpfs: Add coreGPIO support")
>   8c24b6f1709f ("dt-bindings: gpio: mpfs: Allow gpio-line-names")
> 
> There's no obvious PCI connection for any of those.
> 
> Krzysztof, can you drop them from pci/dt-bindings?

Done.

With some of the DT patches, I am not always sure who will be taking them,
and so to err on the side of making sure that things are included, I will
pick some of these up.

	Krzysztof

