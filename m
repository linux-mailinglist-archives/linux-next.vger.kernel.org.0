Return-Path: <linux-next+bounces-3618-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4E96D97F
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 14:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48FFE1C22D1F
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 12:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6F519CCFC;
	Thu,  5 Sep 2024 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRLBQNBR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F0819AD7B;
	Thu,  5 Sep 2024 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541067; cv=none; b=V+t0SdAMhGEu8Z8Y75+a13FmZTByrIBksW3fK1gZv+i9g2M5x3oWCuDQON2fUle43hdDNt5FN9Jr7R6CKjCgrbFmIDkUJegLKin0+2NIT16Abt7NyLfNBNXjT4C1UxsTk8BHEXG6/KgqPPA+4WcqI1QleZFyrZ6aGL7Meeto/QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541067; c=relaxed/simple;
	bh=ixtCXrrq2AAw6F2enhQRJCJU/TTcw1yXzJdKHBdJ2wU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvDj8qbNth1LD3m4mseoX292iuIIOsyyc+/BmiMQ7MCms3oKWdanV69gulUvCJphtrjsuAYT/3Uh8YryDn9OZB3R8WKZR1cG5Sbq4UnQsN7vHYBmJQbGRvqKVu290pbvI/PqkEcycZGcokz6hHBUZ6P3DBquO8xMejkBuS4Tlf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRLBQNBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827D5C4CEC9;
	Thu,  5 Sep 2024 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725541067;
	bh=ixtCXrrq2AAw6F2enhQRJCJU/TTcw1yXzJdKHBdJ2wU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HRLBQNBRWQL2+sNhDObPXa+zO4+zDg8xY6Q0f4LyGwUbBnTKEnvgy6PoVk96fnfjG
	 BuQEJiqgxihhH0Z+hCP7UgCIxgqILyyIiJjkh9Ve0m2VWYxyTyTGLAS66NOKZdUGkB
	 vJpmr9s62ctdPxyilgDt8lF8Z30NfXukmcSGstf2QUKjZSyVqmXb9NY873XVQiGL+4
	 nM58cTlz6NywU5v0excvNJzfFr1sgSGd+sF6Mbh+WO78pCqzf3a+3BTDk24PwWNw3z
	 QP9agq2TRDR8/gHR4uZu3zGwBmKqlKI4Kj2dQsgVy6glGVzKBV1DogX+8b8dlOKZn3
	 6wYz9Of6ECyEg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso1317686e87.0;
        Thu, 05 Sep 2024 05:57:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjqcbbZHYx/Ww2QBsCGzEr4WJzCLAhDkpidw5TstwN/N040ZLPI5uAwynzuogHC/LSx51+tnLbddX0dg==@vger.kernel.org, AJvYcCVY7XUusIXALhhBRgGO3r2mLwSfWwctpxg9qdkTezU6pWhaCSd4EDZImu1wqkIdDZqE/0OJ4TnzCcSMNwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX3nBZMWy6pK3xZK+Nvyo+lOCSsKZ2w2DmYtKxjgsQ5qKFtDrZ
	tmt87KlbD91DjMGot/KqqeTSeqxfpOOfrrpSF9uT+l71usjC9DV/wVjormFGfEFT0HTZ0Lf9fD6
	nX/+yO+m5pFQrEW6aNZAsxrbAcQ==
X-Google-Smtp-Source: AGHT+IGMzxk0ZPFDvWu0f8C34drJiQJmA1D4P26QsXwZTnT/mOa9XuvEl2qGgJzUt0Fm2mxCEE173SA3VYlSZ1kXix4=
X-Received: by 2002:a2e:a984:0:b0:2f6:62c3:4e0e with SMTP id
 38308e7fff4ca-2f662c35511mr23615901fa.6.1725541065901; Thu, 05 Sep 2024
 05:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905164019.5086e9b1@canb.auug.org.au> <20240905072710.GA1538040@rocinante>
In-Reply-To: <20240905072710.GA1538040@rocinante>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Sep 2024 07:57:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJGZW+WFaxEQCnTdSzEuhBmUNBCdzeFfnQX07ii3phfgQ@mail.gmail.com>
Message-ID: <CAL_JsqJGZW+WFaxEQCnTdSzEuhBmUNBCdzeFfnQX07ii3phfgQ@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the devicetree tree
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 2:27=E2=80=AFAM Krzysztof Wilczy=C5=84ski <kw@linux.=
com> wrote:
>
> Hello,
>
> > The following commit is also in the pci tree as a different commit
> > (but the same patch):
> >
> >  80cfdfeb8367 ("dt-bindings: PCI: layerscape-pci: Fix property 'fsl,pci=
e-scfg' type")
> >
> > This is commit
> >
> >   f66b63ef10d6 ("dt-bindings: PCI: layerscape-pci: Change property 'fsl=
,pcie-scfg' type")
> >
> > in the pci tree.
>
> Rob took it some time ago into his tree as we were a bit slow, sadly.  Ro=
b,
> do you mind if we take it?  I would prefer our version given the updated
> commit message, etc.

Now dropped. Please try to pick up patches in a timely manner (or read
the replies saying the patch was applied).

Rob

