Return-Path: <linux-next+bounces-9061-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C196C6680B
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 23:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5706E35B443
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 22:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C41531355E;
	Mon, 17 Nov 2025 22:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSzZ33eC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769132F39A0
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 22:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763420276; cv=none; b=Qnh3IHnbFNWLAacZ3bdkSIwXvp61QXTJO1qLs05D/t4COouZiROrjhUb+Npq3s/gn3iaX0RhTHHmB10Es4ThFypHBYH0cp+jRDKpJSpRLTlKJL48b6hu5YMW4KGKlpYooo5jsnLGBMZS552rWzSI3shoTiH4IRi1lXpNC7NyuZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763420276; c=relaxed/simple;
	bh=p1SQoa7xdG0dFDM+h8uVEFi8BXe/WUC54neXjh6IC1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hgp766WxkR8m+kBzmm3b3UN8BQHStwiDQ0zvyAthDd0tdahC2eyxu0MLv7OWCM6lZ6XUjAAtVMRJ9Gt3fllHB3NURLvnT01DWIBehCtSBimmTyxPyNX91uPTD04KX4mvyQ/oySvuK+nGVqja4CXFaF1CBYFqsGe55Kv1WGZG3B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSzZ33eC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DE0C2BCB0
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 22:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763420275;
	bh=p1SQoa7xdG0dFDM+h8uVEFi8BXe/WUC54neXjh6IC1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MSzZ33eCYQRlTlU7QLW9UNGSBsUWQwF8CmK6nxpou/JMMf6aukwIr5ASnNPpnQu75
	 4g4nzrhDr2k0L6+MPxv9tPi/U4TT14Y1DniXHGMPIO9q1fifPSJntzhVxVMVzJ/Wsb
	 SCRW/Cze5M0mqn7zLG6mEJyxG8lgQW4uOa0fk6d+7GNU/FfIajvphZihPacyu0TPlw
	 3f4QfgPXg9Rumac3jAaZMBtQAT5eg3ULoMvzW1uHWcXKdveP71X1koe2P7JlTeP+l/
	 /D+vVq5xTiH3G409bjJR72ZagvYHzcjH9y5+6BOAw7yYXqdElJr+j/KjHfsJqPTYA6
	 ggx9oEybliZjA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b739b3fc2a0so238388466b.3
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 14:57:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+y7clu+R9x6qJz7JR7/MsGFI5iJvAyjhnG2YcHIUVZq2CZ6vltbLk/ap6kyxkT29ami8gmmoJPNxh@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOyOJJ6k4etnQq4TuAJ+Dz+NMQ8fs6cNdkiBrZo0NrPMQbJ7I
	N/NNBcs2yOC1bGL9NHZJ8gbY/eqqTiytdYlFo3jEMiPRIGYOt3pSqDrSj0fVj03oQbcldZ9XRoy
	0Uzb0oVsoP9pvx/HdetLV6bzasvAlLg==
X-Google-Smtp-Source: AGHT+IGEW00DuVZQyW4fl3eTipIK5hc1m/egjyr/EuiitDWZGzBbFHCav1NS97i2cvBuaO2FFzQ2uV0CVY3jmEvI5gE=
X-Received: by 2002:a17:907:980d:b0:b70:ac7a:2a93 with SMTP id
 a640c23a62f3a-b736793d8demr1400822666b.43.1763420273365; Mon, 17 Nov 2025
 14:57:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118093848.53df748c@canb.auug.org.au>
In-Reply-To: <20251118093848.53df748c@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Nov 2025 16:57:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK22+X3aO==2NU1R1WAHwUf5sPCszYDHEYDF__B98OJLA@mail.gmail.com>
X-Gm-Features: AWmQ_bmYvJ8lDzAbtLAbUlIaP-UWm3_mXemmpeqPBss0iqakn9hHa-Hw4ikxv64
Message-ID: <CAL_JsqK22+X3aO==2NU1R1WAHwUf5sPCszYDHEYDF__B98OJLA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the devicetree-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Herve Codina <herve.codina@bootlin.com>, Saravana Kannan <saravanak@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 4:39=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the devicetree-fixes tree, today's linux-next build
> (powerpc ppc64_defconfig) failed like this:
>
> drivers/base/core.c: In function 'fw_devlink_refresh_fwnode':
> drivers/base/core.c:269:23: error: implicit declaration of function 'get_=
device_from_fwnode'; did you mean 'get_dev_from_fwnode'? [-Wimplicit-functi=
on-declaration]
>   269 |                 dev =3D get_device_from_fwnode(fwnode);
>       |                       ^~~~~~~~~~~~~~~~~~~~~~
>       |                       get_dev_from_fwnode
> drivers/base/core.c:269:21: error: assignment to 'struct device *' from '=
int' makes pointer from integer without a cast [-Wint-conversion]
>   269 |                 dev =3D get_device_from_fwnode(fwnode);
>       |                     ^
>
> Caused by commit
>
>   227c4e0e70fe ("of: dynamic: Fix overlayed devices not probing because o=
f fw_devlink")
>
> I have used the devicetree-fixes tree from next-20251117 for today.

Sorry about that, I should have found that. Now fixed by reverting to
the old name.

Rob

