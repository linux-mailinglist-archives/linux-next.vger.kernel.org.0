Return-Path: <linux-next+bounces-8495-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C164BA0649
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 17:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2495A7A6EC8
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 15:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401FE2EE611;
	Thu, 25 Sep 2025 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzcdXdGv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C7A2E1C6B
	for <linux-next@vger.kernel.org>; Thu, 25 Sep 2025 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758814790; cv=none; b=kIvDp22AJrR6dw8EXu6xhre5MiVzPFHen9+Gm7jTVLNIKxuLveLqiUGU8sJkpu2I2UXxkHLEgfklNmD/A90HrE7SIDM4imBjjPkfYjzDuFELv2FzVQJmBuqN7A9YJ9wEUeJ9aCuKFbsk1fwx7UdeAocFEDsT0Cwo9mB3S6SlMlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758814790; c=relaxed/simple;
	bh=fcx1xsQ2HV2BsgfD6Y/SkjMcXQLAmOVXzQfm7XG4V+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrDsAwAjryrmmhjGVIniI/pK2FosLSFIUbO/v0z7QjHXbK4B2Q4oseGanADpB8CHH4TWxwGx7J6ZIGS7o62ZmswTfpUqaNfbbAgcapZDc1Vn2qdEcwmCpCT60Or7Y/rKF1OobPNoqmkEsntJXOCxXo0KWHHj3+l4G0QzWf14x60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzcdXdGv; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-78eba712e89so8155016d6.3
        for <linux-next@vger.kernel.org>; Thu, 25 Sep 2025 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758814787; x=1759419587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/gxM2GZ//p3vsM9/c44+z51oZMOCRO2uPq/3cokxHU=;
        b=hzcdXdGvYf5Ug4nt1N55Jr1Qb7mPoptzIRJ6OI+N/LvgcvYajNsmi3CwqOwNNWCg/n
         FoWKOLGr0oB7eWfFTvD34sw5wRmQoHWTaPNMlBXDjJEAVQycGprQpthGEIyQMt7Wfqon
         QAgEQA6sj4fLmEqXhFRlncWk3ElYvgD7BJINo41Q9JbByNUwF28bse/aXWbPvslXSccK
         OMhILsv3k+8ykjUzvIQGFSCo5VJ5ECz3Rd5JOzX9xLYOIIGPROeF/J0+K5zQEDMYPwoZ
         L4dnKWuKLH2cvtJIGSZWLh7K4QX/tx8WH+R/llhvWmSuulYfpGlriXUjAszHS5rKtLzZ
         laxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814787; x=1759419587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/gxM2GZ//p3vsM9/c44+z51oZMOCRO2uPq/3cokxHU=;
        b=pDsMP9bIV9Gq8w+lVmdIhAuCQQ3VvqIxOTPWLZTzTxXQiOje472LP5dY4rzdaE2a97
         Zq3RqYzeAt3oyJ4rPaRzWZYaZ9T2UXPbkniB9SZCULEMyMD5VXpZG7gnSd+r/umwJr7p
         ShNMoyYZpmT32JVJdpP5+38+hlaDkhWLjfq5ZvlEvJUalTFwwWksW5WQH4TUBQ6iKSlY
         Im5zONh0FsAskh9SH3wAjJLhP0MJI1xRq0nhd86p5TDROxiJwN34EiGJHRD10Q5Fe9FR
         t3Z39zUcSbdTE+diBp8eV0FKAn0D1B8wYS1IhPlccKTL8Ia6ToBBGjUj7n98vi184bJy
         VgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUShmOy1PPsI92g1NdwAW7z6UZfOZ0O4QCX0XAqmP4G0rg9iPJJ8UNydgZZg4ePeIO+9n5+dwBcnHvE@vger.kernel.org
X-Gm-Message-State: AOJu0YxRbx+5sTCn6R0QlPhNUhcIEyT0qX363NYgPWh8oxH9GnaJyvz3
	wyS1qObidDdmr6Orr/05mBaVRGcKMaqrDbQ2VDKjY7M7ALK6tS3vQRVV2ZoGUl/AyFl/8ZOzvTh
	/vElzjVhD0mGWOK9mYaYm6ZfK4h/4rsc=
X-Gm-Gg: ASbGnctf/YP01Sdsk9QXXQtnFiy2DzguE73hSQ+yOi1X4yxQWPzg4jqAYAhuEYKRhB7
	RAZrtuHcLiGC4Kz8sPmF5tONRyorv8o/e98jgDe0kU9TrbL650E35DoDPFl4W2IlTq7D527ld8j
	/cIcv8TTjF/cRMbKMKpTr6+8Z7AstybQJXMEFjmTkOutngXmO3C4Jznc+6Qv8pdtxjO3wJPYDMX
	7GxeWKyPuF368aW4TeELDVivArzDYjNpiXgavicx66FTETmcRdBHLiI4i0oykTCw6gSMFZo0i9u
	km9tftnXimKamzmIfK6XlG2pQ/0BF1Sj3rVoDsp4UK1FoKiyOOIAqipq/rIYgH1a1cgJRgncIWM
	/CoTz2gDLuXsbIK3v2JAdRjGujUp74hAT
X-Google-Smtp-Source: AGHT+IES8OpxO46lya6Ja3cpgdYv4JUSL0YgHDVfezBAbW3XrWI16+5dA+Asr6InsRlLJadadFe3Lz5rMdcADr3IL+E=
X-Received: by 2002:a05:6214:3017:b0:7fa:dc54:5e60 with SMTP id
 6a1803df08f44-7fc32001335mr55979626d6.24.1758814787364; Thu, 25 Sep 2025
 08:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aNU0D_3x5WC9qBzQ@sirena.org.uk>
In-Reply-To: <aNU0D_3x5WC9qBzQ@sirena.org.uk>
From: Steve French <smfrench@gmail.com>
Date: Thu, 25 Sep 2025 10:39:36 -0500
X-Gm-Features: AS18NWAFD_qjJ50kmUkTB6KYbooErErcY7xLI1bEOzK65no55USKLs4S-XcQjgI
Message-ID: <CAH2r5mt_TXXsrik3HPFBfSOcVm9Azu4Qprj5ps51S5VXGet3tA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the ksmbd tree with the cifs tree
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Stefan Metzmacher <metze@samba.org>, 
	Steve French <stfrench@microsoft.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	CIFS <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have updated cifs-2.6.git for-next to remove the duplicate patch
(that was already in ksmbd-for-next), and have updated ksmbd-for-next
(somewhat fewer patches, and he has reordered them to be less
confusing, and fixed the missing Signed-off-by).   Should be ok now

On Thu, Sep 25, 2025 at 7:22=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the ksmbd tree got conflicts in:
>
>   fs/smb/client/smbdirect.h
>   fs/smb/client/smbdirect.c
>
> between commit:
>
>   8c78e78d99355 ("smb: client: fix sending the iwrap custom IRD/ORD negot=
iation messages")
>
> from the cifs tree and commits:
>
>   4e152f2732650 ("smb: client: make use of smbdirect_connection_negotiate=
_rdma_resources()")
>   c0a6d2d41a3b6 ("smb: client: initialize recv_io->cqe.done =3D recv_done=
 just once")
>   d5b264e469201 ("smb: client: fix sending the iwrap custom IRD/ORD negot=
iation messages")
>   8435735745f65 ("smb: client: make use of smbdirect_socket_parameters.{i=
nitiator_depth,responder_resources}")
>
> from the ksmbd tree.
>
> I don't feel equipped to sensibly resolve this today and there's also a
> missing signoff in the ksmbd tree, I've used the version of the ksmbd tre=
e
> from yesterday and will hopefully have the time to look at this
> tomorrow.



--=20
Thanks,

Steve

