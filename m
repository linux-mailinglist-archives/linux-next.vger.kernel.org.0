Return-Path: <linux-next+bounces-6597-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21197AAF69F
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AE0D1BC66A6
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 09:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE04A1E22E9;
	Thu,  8 May 2025 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="ohHovBwo";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="4szNP/mH"
X-Original-To: linux-next@vger.kernel.org
Received: from e240-12.smtp-out.eu-north-1.amazonses.com (e240-12.smtp-out.eu-north-1.amazonses.com [23.251.240.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5202F1C6FE2;
	Thu,  8 May 2025 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696030; cv=none; b=uBEhYGdiitxT9MfPCBPM9bXEAg3S4Kw6WlVq7fTt6j9/E3VWG8dyoXWutidxfULiPQ0ERx05aNWzU1I4ZaiIS6wUZuAcKxigmTiPE3Ot5L0rg2XtOkpnNw3EyELwv1BSsnjgAM3kr5uLqKDrbtnTiK7RaiO8RbavqYQq3TbMDCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696030; c=relaxed/simple;
	bh=SThKzxl+IKKJS2MawyJClzR5TBlOJAXMzYLYLwwryOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYFxGkY1sl7wgy5G8Ee/9TJCETVtGLwKDDX+dlhBQo+Nz3cJehfD6UdnhVir5BwgB/Z4uL/rPqNee83j5dzC7G4GYUjuccY69Zf8XzEpXdGl0IgwExLEjdK24InZdY9VgLdtmcnMSzahquFIDAofrXwMzhy0ydM8O3LfudmyvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=ohHovBwo; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=4szNP/mH; arc=none smtp.client-ip=23.251.240.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1746696026;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SThKzxl+IKKJS2MawyJClzR5TBlOJAXMzYLYLwwryOM=;
	b=ohHovBwodYpLzMrPo6dlgcqa7Sf6o/dFUSZfXUmYEx21lpmpOHDK916u888/NXRI
	zgXzeAgxSxk8SOGOxPypfRBIUAJQPDeGNQReHR8sBq2rphQf/Rma5GMfSs+1CsptGbz
	Qx9JC7IoZPL7peuUP46tke3VsivdKnZccqiY2KBObt24EC+RoCPt4yKAsfkqlyw+U/Y
	PsVu+0kqAamEXFie+YQsuH6n9le3SjEEOG8QZ35YC4JFeUhh9sO6fpGG/dhPdF9C/c/
	xjE/lvhwZqsKkLjoMjKmflp3QV9SGd1iyZ71NGrnSyEux5r98TsOIvj5Byf5UZheHNn
	ZFmaVXdgzA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1746696026;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=SThKzxl+IKKJS2MawyJClzR5TBlOJAXMzYLYLwwryOM=;
	b=4szNP/mHSyCDuOGu6MMpxT3hgyrs637Y1eMdvbFNza5kONaCwgLHg7mkHCWZtlwi
	Izdmoqr8DFZXURKR52m0lASJ90efgCTB+x+KKMnBGTBlfRB9eVyjhhKGrQ5zlgi3IeZ
	ENUExutAbQc83incJRBcP2u98yzwICvtare5QEfQ=
X-Forwarded-Encrypted: i=1; AJvYcCXa23GnQfbay0NnKk1DOForEJxFaTwxyaBhGN6DU3MywqbUvsCDhzNq8ZCyb6Egr1vn2TFKWdZCQix7og==@vger.kernel.org, AJvYcCXqPem+Xoup8XuP92dPR3AEt5l7TXHkqeLKrD5IaIbtzKtPgmByD/KvQHHz7mKQzTLZogsm5BIxWkhgwDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFtz1nGZ0v3HEP2IyM9+RU0xjj3seYZE9F0EHK7r5J3TmdcxUJ
	OE/ADCPD/Y+y+LgAbWD1xgiBoge8A4wqIZowU3XkiiB8yG4/z87JPW4bI/BK/6ULxExl7/fHcVF
	b4KL3Tu3Dvyi2DLkYh7KWuZwJXc0=
X-Google-Smtp-Source: AGHT+IGg9LyZYIzsQsK3d3j3V6agE9ZkxUiLACBsACC2B+VivMDPu9lP1Jlg+5678N6r0kn0EiaNpiUfueu/tCTBkTI=
X-Received: by 2002:a17:90b:4a82:b0:2fe:8282:cb9d with SMTP id
 98e67ed59e1d1-30b3a6d339dmr3557791a91.28.1746696023768; Thu, 08 May 2025
 02:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508182504.418552ef@canb.auug.org.au>
In-Reply-To: <20250508182504.418552ef@canb.auug.org.au>
From: Ozgur Kara <ozgur@goosey.org>
Date: Thu, 8 May 2025 09:20:26 +0000
X-Gmail-Original-Message-ID: <CADvZ6ErzVX1gx4LXAXUB4wSEa8Q21O++P3iVsgGvwqEy9tTq8Q@mail.gmail.com>
X-Gm-Features: ATxdqUFYgNZFJ0pwCmRMUypGqdD-0JsBXjdCOuTMaq0A18WlxVUD3HGLwe_fv3A
Message-ID: <01100196af32388a-d226b95d-f866-4863-ae9a-698aef7cedc6-000000@eu-north-1.amazonses.com>
Subject: Re: linux-next: build failure after merge all the trees
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.08-23.251.240.12

Stephen Rothwell <sfr@canb.auug.org.au>, 8 May 2025 Per, 11:26
tarihinde =C5=9Funu yazd=C4=B1:
>
> Hi all,
>
> In my after merge build tests, today's linux-next build (htmldocs)
> failed like this:
>
> make[1]: Entering directory '/home/sfr/next/htmldocs'
>   PARSE   include/uapi/linux/dvb/ca.h
>   PARSE   include/uapi/linux/dvb/dmx.h
>   PARSE   include/uapi/linux/dvb/frontend.h
>   PARSE   include/uapi/linux/dvb/net.h
>   PARSE   include/uapi/linux/videodev2.h
>   PARSE   include/uapi/linux/media.h
>   PARSE   include/uapi/linux/cec.h
>   PARSE   include/uapi/linux/lirc.h
> Using alabaster theme
> Using Python kernel-doc
> /home/sfr/next/next/Documentation/virt/kvm/x86/intel-tdx.rst:255: WARNING=
: Footnote [1] is not referenced. [ref.footnote]
>
> Sphinx error:
> Sphinx is unable to load the master document (/home/sfr/next/next/Documen=
tation/index.rst). The master document must be within the source directory =
or a subdirectory of it.
> make[3]: *** [/home/sfr/next/next/Documentation/Makefile:123: htmldocs] E=
rror 2
> make[2]: *** [/home/sfr/next/next/Makefile:1804: htmldocs] Error 2
> make[1]: *** [/home/sfr/next/next/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/home/sfr/next/htmldocs'
> make: *** [Makefile:248: __sub-make] Error 2
>
> I have no idea what caued this :-(

Hello,

Did you run this command before you got this error?

$ make htmldocs

but the error shows itself because index.rst is not in need requested
directory, please run:

$ git restore Documentation/index.rst

Can this solve it?
Regards,

Ozgur

>
> --
> Cheers,
> Stephen Rothwell

