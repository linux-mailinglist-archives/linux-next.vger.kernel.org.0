Return-Path: <linux-next+bounces-5141-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2923A08D5D
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 11:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E23F93A480F
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 10:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38BD2054EE;
	Fri, 10 Jan 2025 10:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+ny6nux"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871D1E200F;
	Fri, 10 Jan 2025 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736503702; cv=none; b=WFsrAF6dG7vJLzXgW+F3eiXeFEWoX/JBoYY4ax0R0DnCZ/wUlrsOZIFOuQgEbhGk5KNXmovQrx0eAboFC5mOEfmNDDIXihS1/Uf0MPTlBZ/uNhrLL1cK+q8VOBqGUu0aZUfNq8VaRCoAg/JK1Az2uTpkqQhiEYUFK6t1+mrSdT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736503702; c=relaxed/simple;
	bh=cL+2RDnNyVmOpa2/LA/Y5m0YwGykHY+3LRRJPQBqJtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aenYsUeA68NwQ3Nu6QGF7r5o6QBIAb5aDn3fCn/8Koz8PajZBUCPCeGPjIziQjgavonKGgp8vFMlz/hXrLGzVghdzD5xSGPv7UNHMnpDRB1Q15C0HYnST6HajmjaUit6w2c8gnhE3qW+hJWGx4HdKBFyATSG4wmp9r2i4cReOL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+ny6nux; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef7733a1dcso384521a91.3;
        Fri, 10 Jan 2025 02:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736503701; x=1737108501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODc2jsluLVTWCb7dwmw/jpIq1b3M4Odlu5l+F1d8iGw=;
        b=l+ny6nuxbR4/CdEzJ26k5qUpR53kmAQX1+KGaa4eK6WWKnKr5OiM75vaJ8F8fAdWSg
         qRqd4TxdrkUeO/fL2v5UEKl6D35LQn6GzAPAQkCFBMOvPO/162LJoDwhcFiCUozcA67m
         8TriyXMO8WhBYM/xt6oANLqDYnaU6FtUzydFGwGk5Elf2IWMAq7AHPq17AcmZwidrySh
         TmaMtpT+sTOqxeAnCRzaQl5qGP3S7ZGQSyM0Rp8C9Xw80iq7XRWqGBOboFzS008F2rqz
         AuxjI6w7oB1SdDWtDBTL8kqCD91liujjOzYOqaIpypoJQb6bWDirv7XOa3JXYpXse2Va
         u5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503701; x=1737108501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODc2jsluLVTWCb7dwmw/jpIq1b3M4Odlu5l+F1d8iGw=;
        b=HoAsYPRzNybIVH+B5m4sxILVwkTZ4OcpKYiF6Zev2mWcZY8hL4J0c8SglT2TIIMJxU
         VQfz3+Xl0RcHLbmfV/jpN/6rIJ3d4Ay36kyOgdxCYL01lia/sCrulI/0xBZpDEgOVOYF
         UzmKyowZBppnJAz5Yn7i+O8zvDuOJ0/UL8V9bBQgrD6C0NU4efj0IXN4sTGFvkT5Hcyq
         dVZnPeIEO7MJuJOkvdsrsXAMJmtMvc4ds8OkzfrBg+LG/lZAFpO1oHUTBYV44i0tg5lT
         uPcUFVe+R+Lq/O5BFWm0UMXNzLJ+pGHZWS0ZC5wZNDNojC/TYybMzUeKFyjdLxFcSoyU
         OH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQx1qsqiz9rVfNKlGcGwkamlVY4Hgy/yueEqKnZaNkv3zvjnf9MEV7ogEPtlyg7c667dZjHE8KoB9D+YY=@vger.kernel.org, AJvYcCXqdcXXuGIjzGBK36lBo9O9zfuXbk+53Xtd5t9ibNYzkbnCevQcC+cqf6rmmF7/hAyFlkpJygWzjIrxBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmewKMXMfkZDknfiePrJZDy5tQG7gbeKjNOeFZ8NKq1sIR87Q
	ubYxgXgtTpga5OqjQ4rngUuGZaHpnlJMt5vn/0CYXWT3sIxVhWv0eJwLzx21JOFQKU87DEhK5lJ
	YiRhpy0ihKpso8RmD5bx676RwE1FI/Dk9uMA=
X-Gm-Gg: ASbGncsX/yygKO8QX2kQCEldBQtRDvNChKTssxS3D1eZnwppaHkM/o11DelstxF6MWI
	5DWV05ya4+8TiRFcBn0pbcjAYOapXLoVanlIeiQ==
X-Google-Smtp-Source: AGHT+IFRucVjTDEUJ1zA0yxz9b5BOIoLlFRJEohS88ENENZbygFhjYFwj/UFIPIxl9M0XmAuKzTEEJp6mk41yvyzQ4U=
X-Received: by 2002:a17:90b:538f:b0:2ea:5e0c:2851 with SMTP id
 98e67ed59e1d1-2f548e3c0c8mr5775424a91.0.1736503700545; Fri, 10 Jan 2025
 02:08:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110162828.38614c1b@canb.auug.org.au> <CAH5fLggV5QC53u9xypFga4yheem+7vO=fNqLE47zRj=t_H8eYg@mail.gmail.com>
 <2025011024-clean-refold-b170@gregkh> <CAH5fLgjLPH+LrgeLzav5qa951CJWpQo5aFjVWwGTH0zdKZ6LUQ@mail.gmail.com>
In-Reply-To: <CAH5fLgjLPH+LrgeLzav5qa951CJWpQo5aFjVWwGTH0zdKZ6LUQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jan 2025 11:08:08 +0100
X-Gm-Features: AbW1kvYeazRYQ4z6vSju8vq1WC80s9mk491wz3rfdsK8bCu65aJlQeYnsoxD5_s
Message-ID: <CANiq72=Cfb4eXCd7-GLJEG7+Na1+ng1mbs0eYgaDDyLDf8phpw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 10:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> You can take it as a real patch. That will make your tree compile both
> with and without rust-next merged.

I don't think it builds without `rust-next` since the tree does not
have `build_error!` imported (from the prelude).

Greg: if you want to pick it as a patch, please do instead:

-        kernel::build_error(VTABLE_DEFAULT_ERROR)
+        kernel::build_error!(VTABLE_DEFAULT_ERROR).

Cheers,
Miguel

