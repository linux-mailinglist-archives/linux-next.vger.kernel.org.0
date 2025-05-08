Return-Path: <linux-next+bounces-6600-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F0AAF6DB
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 782441C047F4
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 09:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4628A265CAD;
	Thu,  8 May 2025 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="RB+3/ny5";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="wTZ67MhC"
X-Original-To: linux-next@vger.kernel.org
Received: from e240-9.smtp-out.eu-north-1.amazonses.com (e240-9.smtp-out.eu-north-1.amazonses.com [23.251.240.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A73264F88;
	Thu,  8 May 2025 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696945; cv=none; b=SPp+8f1IerPc6kOolMNb71UkrMfLGIdWETGMKrPnK7u28q84Pw8t9uAdhw320EtV6o47RfgQxQeeFaTGArK+b/hqyEhvrvSJd5oSQskH/6hvjud7GjqssgMHYhKDVPYzSzAD7UTBTUW/vgWLrArxf4C/IVRiwCjgPcdthjuqeCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696945; c=relaxed/simple;
	bh=tSpqGws+0ptH5RXX73pEm+l68ZMWnxh++vA4MDxWtVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJFSfPhdN/9fzPl96RmdbQMdbc6Ne7aoarsfOKV7fHyfVG0WG4L88PHk8tt3fO3Oe56cpfR9F62XjDuN6wU0TL0wlwq5aDq6j15+Oo4QnbMkPZGJDkqeT7YaQVXAFVvYWRhHSdXxpfKLyBC+0Em5ULKwv3l7orn3jLUE5vmFxbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=RB+3/ny5; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=wTZ67MhC; arc=none smtp.client-ip=23.251.240.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1746696941;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tSpqGws+0ptH5RXX73pEm+l68ZMWnxh++vA4MDxWtVw=;
	b=RB+3/ny513cdOgEPHuIqAWGqHt+1M6ScSvIncCY9P64fcw++yxcyEch/aFGBsbAz
	OoNA9kbXFWGy5kyGJeyijnH3WOM4t98wEbx9RdofN+o/Rafn7i5JCQAuDfnA56ZpySn
	I1Lv+AQZZ7zYHbjwglEhImyhwTJuzD+CM48zmcryOzUnyJI4uYjEMWh4XRDeoZRm5l1
	L8rIe4gx3HF9KlOKeWuR8wf9KyuWTsATQDhNU6cMYI+QBT5c+bbftd6CoCkppsFQCYq
	gxyGXnkIi329t9/WE4CTCzr0RO5E+F7g/IuFC1wRNyah4w2aI6qNFja/8ONNqCAA2o9
	jAmyzh4e4w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1746696941;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=tSpqGws+0ptH5RXX73pEm+l68ZMWnxh++vA4MDxWtVw=;
	b=wTZ67MhCC9BCOTa6/AhoxSY8HAwWjIRDBOPW997NBRKvTgbyN3zsNgNB2VSv7DB7
	Vdei6dDtxqr8506RYkM+dE0Qfsl4neVugNmsTpk+zdPUdxRTHnBezjNo8Gbw4TTh8k5
	hnC9wTrwZ6zMN+qFHqyOVfO6MafONR4/jFcm+fxo=
X-Forwarded-Encrypted: i=1; AJvYcCUXQZ1trMURKDB0mzgSWWlpR7ixGuu1G0pwpli5EOLS+qLplWeyJlPc8Rb9FdzG0DVXIlrtTmsYS3O6og==@vger.kernel.org, AJvYcCVXffecv0nQwgZsYQkRT3w/iWRHz07QIVYvprf++2VCOZVvQgLGI3CepFHbPkeS11ukTgU5jxKgsT08a0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr9X6iuRiSlkYBOHiEvtWEWchM+wcLEhTH3/5ijHvNfyMP6IkN
	pYQIJ4NH5ZJPwbjdPPg6wiIDKQci2sEgq+ak9dO5TLiyxtpmVTv5J2+EyexeGiOpHML71vQq8F9
	M1LPEsH05cBkd1Ut55dYP0cIeZhE=
X-Google-Smtp-Source: AGHT+IE9UUNjlO7voFPg7H2gzXeUwjO2zbk6Knon9zzUUG/FUvLAPFFb1uBZHaWSmSZEBe/VYMRd5yNGMrH5QJqSmZw=
X-Received: by 2002:a17:90b:4a05:b0:308:539d:7577 with SMTP id
 98e67ed59e1d1-30aac097e2dmr12043532a91.0.1746696938764; Thu, 08 May 2025
 02:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508182504.418552ef@canb.auug.org.au> <01100196af3237f3-279dac0b-ad07-4f5c-bbd7-0e0f2d14659a-000000@eu-north-1.amazonses.com>
 <20250508192713.4fd440e4@canb.auug.org.au>
In-Reply-To: <20250508192713.4fd440e4@canb.auug.org.au>
From: Ozgur Kara <ozgur@goosey.org>
Date: Thu, 8 May 2025 09:35:41 +0000
X-Gmail-Original-Message-ID: <CADvZ6ErmN-KuWVb72M7sq4N90_Q_67eYesLPPNNGwo9tcOFYnQ@mail.gmail.com>
X-Gm-Features: ATxdqUFv_QmoGFww-827aAKWFuT1EJzC6A0OGynxNi9M3zim8UVFkkagh376xZA
Message-ID: <01100196af402e78-ddc8533a-d06e-4e54-a49c-ba3c3e022700-000000@eu-north-1.amazonses.com>
Subject: Re: linux-next: build failure after merge all the trees
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ozgur Kara <ozgur@goosey.org>, Jonathan Corbet <corbet@lwn.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.08-23.251.240.9

Stephen Rothwell <sfr@canb.auug.org.au>, 8 May 2025 Per, 12:27
tarihinde =C5=9Funu yazd=C4=B1:
>
> Hi Ozgur,
>
> On Thu, 8 May 2025 09:20:26 +0000 Ozgur Kara <ozgur@goosey.org> wrote:
> >
> > Did you run this command before you got this error?
> >
> > $ make htmldocs
> >
> > but the error shows itself because index.rst is not in need requested
> > directory, please run:
> >
> > $ git restore Documentation/index.rst
> >
> > Can this solve it?
>
> Please see my second email.

Hello Stephen,

ah okay, i see it now and i'm sorry for sending you an e-mail without
seeing it.
and the error there also caught my attention.

Regards,

Ozgur


>
> --
> Cheers,
> Stephen Rothwell

