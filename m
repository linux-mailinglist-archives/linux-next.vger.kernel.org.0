Return-Path: <linux-next+bounces-6250-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0ACA895DB
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 09:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90BFF1899712
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 08:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0A527B4EE;
	Tue, 15 Apr 2025 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJvUn/bM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6711027A937;
	Tue, 15 Apr 2025 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703976; cv=none; b=Ot3XT0wVzl4sCNYjOGhAQQwuHgNzJGZTzw+UjL8hj0CnbVsHVm/u25MF3aKUv3mYPzBWAn5+zeait+TbvKw+uHjp44aISJBsz8tAn2iIBXm1//PJ6fYWKWugnM5hW7Fe660cmYCjyriOxl2ItL84Z8ebWzmGb0yI7lEY97n075U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703976; c=relaxed/simple;
	bh=uR1O8ZZvZmjOBhiBYTQskmTA/I3mjL0NlKi6//xSjZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sg+mWouwP3QLRkw5XRlL8SV7BkY8JQP52Ilp2dhK5ee8WOAfyNjgDyLf5iH6tQ45o9gzcvT5kqTYLpCRRb8CZnTHrHWwc4IH5Rl4kCM69VX+sb++xb/8XM9qYKhjnRPBRrqph3+aj6w0GzbpSRKGVkVDKpZ6fustggA8UGj74Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJvUn/bM; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30332dfc820so5901596a91.2;
        Tue, 15 Apr 2025 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744703974; x=1745308774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEFV5bIBr/cofPLBiI3DIVx6RdeQqkyirfkoTqfZW9w=;
        b=iJvUn/bMwVL4+OvYsHLR2Cdv0gQ84LtmR7/+q+32RBz0Yctg3sdZ+mjGaH7xQ2dvO6
         5m5pN0iW7wQU8aoABawc0mOO39/qpHZMHnKhRThSkfGdpMZbVqDpqPcG7yjjW7L9Bmpd
         GEhNgt7I1M+Yp3Bo9ByD6EBkH7wNl3lFD5vgj2ESPUo/qhDXQUk+G93Um94ogY96KY4O
         htXEvvsNEx3SKHAx0V+DWmdKt2EKLMuJ5oY60cVq9ZXtGCJzs7ps6ituSyT4P/BN5erp
         34ZQREfYtYw9ON8bn/0thoP1q199Qf7SImojxiFYtvD7Y+Mc81Mt0oCdEVy6WAOOQ9mz
         /uXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703974; x=1745308774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEFV5bIBr/cofPLBiI3DIVx6RdeQqkyirfkoTqfZW9w=;
        b=N0Vh9IvGdzPVf8eC/pgxb6ZiRU1zg52Mm0jWZuZG8NqtapWD9QB8VrSffspRyJ9eRp
         2e3jLfdFiJ21rxzpeUGa6tfAlgRUqccNQe7qB8OarIqasGHIJdmw0r9eVTt4fN9NUt+6
         z7i6FczE27ksWf1HK0n8M2tFZdbWuKxSa2ny/6r1YmaOhZ8+LnRi9Fqj7yxO0MC8sCdz
         zxNgV3fpV2mQskRQl+WdJ0Wwri6FrzWpJDgxZspAkJRypLh9mtxKOrSn3gyyPXrLpGh/
         vX0a07/71Y1METoAMU+UBLPDmr84O3n96UN541kRP6wHoa4RoXu9nXsz/oA0L95C8+ZP
         ptgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbwzBW7/QYhIUmqE9CtEVIVK2F5vAGBXlXpHGOpgIunkbbCeUSawTKLXOiaBX9Kc8QcGYAKlFFHf1s6g==@vger.kernel.org, AJvYcCWLVGIJ2hz1g0jJMyaCqCnSUuaee5hXCID4iJBPYWyXknIz/YC+NJAKfPZmdq4ffZHLt1eOn0kTRAW5@vger.kernel.org, AJvYcCXEwHvQT5WiHhK0xlPE3aqv/1SVG0P5q1AEHJFZhTm0PnDN83ABHbzFUb2G43CF6fdwQz/A5dgOazsPnzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuDGtTYN3c0YLjFsmoZuAJ73jFioObbMSODTXMRBZ0GI8CksjR
	kaaiNFYquu3OCpks3iMrqPm2oumxwWoe6GUEmQzu3b73tSjWPY9gP4Jep5JkSf9nVv7/Ivftd+9
	fOR2lzLvuojoohqfGIcHRXvxG22o=
X-Gm-Gg: ASbGnct/5qbAXYF8b+0HveACh/FusgIW3828Ibopap/bc/8/1uyGFexPyxL7+CoBcSd
	xyiC7yCzbw2kqjamshGk5fgY1Od/HnLSICNh4jxqKF0MdPCAmLvh3UOGoUaZh4dWNtpItY71XEA
	30jcZROsyX/xYguPwGxA==
X-Google-Smtp-Source: AGHT+IF2W8A4YkSqajRi/sexIZznSwfdwcvCj2cIEypd4+D6fw2CUP3Kw5bGACl/NOZEQJwvcxcQkRM9OjIrn7a8B9Y=
X-Received: by 2002:a17:90b:258b:b0:2fe:b774:3ec8 with SMTP id
 98e67ed59e1d1-3082367123cmr17928270a91.23.1744703974638; Tue, 15 Apr 2025
 00:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414171511.6c7c80af@canb.auug.org.au> <c2a9122c-1e03-48ec-99a2-696915418e25@infradead.org>
In-Reply-To: <c2a9122c-1e03-48ec-99a2-696915418e25@infradead.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 11:01:19 +0300
X-Gm-Features: ATxdqUFkkn10zwLQOVbjH3hyRsvPbQRipA-IbqqBhLmjY57a3oZXmPOpGm53Qrg
Message-ID: <CAEnQRZBZ-w5ST1i3Kw7+w3qEaO695rEkK1-OTXDde7yBGYfVSQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 14 (drivers/mmc/host/sdhci-esdhc-imx.c)
To: ziniu.wang_1@nxp.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mmc@vger.kernel.org, 
	Haibo Chen <haibo.chen@nxp.com>, imx@lists.linux.dev, s32@nxp.com, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Luke Wang

On Tue, Apr 15, 2025 at 1:20=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 4/14/25 12:15 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20250411:
> >
>
> on i386:
>
> ../drivers/mmc/host/sdhci-esdhc-imx.c:1608:13: warning: 'sdhc_esdhc_tunin=
g_restore' defined but not used [-Wunused-function]
>  1608 | static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/mmc/host/sdhci-esdhc-imx.c:1586:13: warning: 'sdhc_esdhc_tunin=
g_save' defined but not used [-Wunused-function]
>  1586 | static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
>
> Full randconfig file is attached.
>
> --
> ~Randy

