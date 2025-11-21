Return-Path: <linux-next+bounces-9144-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1DBC7AB0A
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 16:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8AEB936281D
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 15:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD363321C6;
	Fri, 21 Nov 2025 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dR5Yw8j6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295DF238C0F
	for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 15:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763740611; cv=none; b=qs/Qu93sdJUsFXDwEAbe2yZRJWJ1Ur1KH2nmxk+BFGWP0YYwCD1+M95h2gUOBcOMp0VAezW+W5zUGZuUMTBzL8v8EzEZiq2/1x6mrvhdGcdxG5h/VVUuoLbq3O6LRRL+c4U0Glzjlte9eXHVhyUge/1MH9UhXlyXSut8TglOJZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763740611; c=relaxed/simple;
	bh=0yKAN8CPXud/kBAh8Ve5pbPcok1j2FBC74OACQMSm38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IB1qgGmErvnVoNRO0CUe2OvFyL45bQFG3wNasFiEwKUqt5gTTkQf5oc/phk2eyk6C8eWEO8g1IDTbZYFUpULZfGznkmUWnJ+Ee2kiL5HiuvCEshEffV6F73WPn0iJ9k75BDVryvJGxoMGnLz0zNjB+vRclPHLLDyZT9DuSjDt4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dR5Yw8j6; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b9da0ae5763so269680a12.0
        for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 07:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763740609; x=1764345409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yKAN8CPXud/kBAh8Ve5pbPcok1j2FBC74OACQMSm38=;
        b=dR5Yw8j6/2cr5NVD0UndrNBASpeHsEg0h+DxEb3OIamYUEYyE3+uuTJjFUyMlo85Lq
         VYl0Z0aeNW1ksWPsqVT0KjSgOHB0f1MXS/kbvv4WoaFZux0LX7aUCfFLkpH84C8Y7/Kh
         wJ4kBF6T+n2yDqBAt9oxzo4t2lex78aP2qy2eZ7YM27m64TrzrxGHxSQfAEQwPEOvBXf
         mrRd7r4k8IAKaWtpSN/WLn5yjlh8ZODVJaGJOoF88rbGomanwGu4KDzid4iO8RFboCE0
         hpg9nzd/mFObjBLF3KCkAypGNLwJ76hmibzY59W/MTS1XRC4gcOc7Gbhn+CHqazjh5HR
         UwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763740609; x=1764345409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0yKAN8CPXud/kBAh8Ve5pbPcok1j2FBC74OACQMSm38=;
        b=c5lN5YQPCM1jonL8s0kOG9KIAg0Sfh2hRwCrcfcCRBStvYuXB4F2kYWRxljsTwAWrW
         dpVhOlIRsf6LbZRPZLpSLQwHqQaVrS7lHxVnbOpvf+sO+k3UyfE4kuPePfV084J5Ksl8
         nqQibGNTIoWierqRAeEPyCwgptNJwJZN/VLzTe6iMCIlpONhnhW2uXjNdC97bsLmUUdI
         mag4s3m2XmKkMiM1Bx9GG0pNcBbIOonPEYkbigP3uX+NAxECNfvE6seD85XkZx7xNf9v
         OEsrGGjyN+TRn+V+qzBToIQ0qHwEmwafzoL7x1ZRJBD9YrFztBycT7etJ6z3wBhlBXeL
         v3hw==
X-Forwarded-Encrypted: i=1; AJvYcCX+RQzLU+sYAxkhU5g71whCms+qYdwcr+jY5LAzL3Wo9Or26OKyPNE3xBzluFTHHDY26Tr0Uhceb7PK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0YqypGTAVVBj0cS1aEinxGNUWTdzwcdqZXwqi3n+Brj8UqaaT
	6Pkumpos56NGi+bADTsLl7Ayj04Lshv7ZcQmf0MepWfMgPYuPODPgbZeVGXVhioxelYJ/raajHy
	lGfIt09cWn42HVyqiPGHjuki+LGkdiOM=
X-Gm-Gg: ASbGnctyp4GNvDEE1HdIwSu4iUm0ReYPqKWa4DpYBBHsughZk5NKa8kRNN2fRcgBmg3
	jefR4Bq3/1OgmeVV22jfiPxLg+KI6vn4GgxDEyNxzFSjqSsKmf8N3rbpHJl1hBrI5xrk1cvF/Mn
	BSL62c1/uQe0fccwT/0h5As0AxT/1MLfmBJoFAXV151zzLPdcRPRYDIK9yGvX9Fe9HMogcpGsnT
	M1FqddlKi6GkIMJZNBwTWG2rd8q0kvK34hsuIQhJ8cLihMTKHHUsNyC+t3eEIGD8oMimPwQMft6
	YSjyAmayre5kZxbPqmmb0ECN9lbvM0dsNmK+tEwT1tqxJrrMsk0zLpkPBIm/japEEZeOklWjcPT
	g5aYpC/KMgGxPCg==
X-Google-Smtp-Source: AGHT+IGj+7SXTrDSGLmAQyXfO3uzkSXbgTClRfAsijY4CsOpX/R9j3sjrL8CGNB1fleq7NcGsfoQVI2NuxFeaFYr9BU=
X-Received: by 2002:a05:7301:1906:b0:2a4:3593:5fc9 with SMTP id
 5a478bee46e88-2a7192a30bfmr1043151eec.3.1763740609340; Fri, 21 Nov 2025
 07:56:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120181111.65ce75a0@canb.auug.org.au> <CANiq72mW=zMbt2W2Omn4PnMDDJfqz3tDtrneMOFz2ysQ34T8zg@mail.gmail.com>
 <CAJ-ks9=LxO8zTy7rQCiXrZGuwwN5d0gqVkQVE_S2QZnXTdu-Ug@mail.gmail.com>
 <20251121153906.1d306ad1@canb.auug.org.au> <CAJ-ks9k1=BLFCfjVrMqQ5u_ak6+g=HtQ6_TP4ZtazPhk0Z76YA@mail.gmail.com>
In-Reply-To: <CAJ-ks9k1=BLFCfjVrMqQ5u_ak6+g=HtQ6_TP4ZtazPhk0Z76YA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Nov 2025 16:56:37 +0100
X-Gm-Features: AWmQ_bkazOG0P1XM6sD4ixnwftAma5rL2vdgTmeahZkHf9JhIKG_LpkW-xTew5Q
Message-ID: <CANiq72kxj-7VjYp2i2VFU5qoRd6OJKPfajZAg+HMX148DU5zqw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Greg KH <greg@kroah.com>, Tamir Duberstein <tamird@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 1:17=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> I don't see why not. It does not depend on changes in the rust tree.
> @Danilo Krummrich?

I think Danilo may not be near a computer at the moment -- Greg, I can
send you a patch to apply (or we could just leave this as a conflict
resolution to be applied by Linus too).

Cheers,
Miguel

