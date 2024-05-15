Return-Path: <linux-next+bounces-2320-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1608C68DB
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 16:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E413B24F0C
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 14:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1191155A5B;
	Wed, 15 May 2024 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdypHi+Q"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D9415574A;
	Wed, 15 May 2024 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715783702; cv=none; b=nSfOOFX8LNLhqJQt6njVaAtk7gYhxhA+5KPacA5t1WL5tmX4lypYp7wHJFtt2rWieQOMWGuuXGqDw16+HUaA7jXwi0XaMgZ9bFpb7hJLjRcwI5/ujufliG6To5T2tCF9/v4Q/qT7N/RKzYYxtcaQL8nAQN8kvMpxHu4PQ7XEqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715783702; c=relaxed/simple;
	bh=I427I+TO8W2CCH8vpGu+2BtTb2kEprfOFf9Coqw5G0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hY7tKBj94oRX3B1kJuuJQylSmVQ2F/1C13AFcTpuBLGeCoIu/uVlM3jn8TlcWluH21G206CS8FvNjtxOPC5/3OJ4L7ZAact+ld2uA4HHaFLGUB0DKdb4Mx+d4fqzDTSKXudOVv2+j5b3l++uWM2fGG7e9Ian1o5NgRh6JYNm950=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdypHi+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08593C4AF1B;
	Wed, 15 May 2024 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715783702;
	bh=I427I+TO8W2CCH8vpGu+2BtTb2kEprfOFf9Coqw5G0U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sdypHi+QcBfSAvxUQgVt9h8nkflKSuF6921sNJWHCKqLOY8MmrsbOy0j/Mzp0xunz
	 uehCh6oWceNV3Q13ZVXi8CirzhXVaum9bTVyiKMfqTz+UWMNVdXTVN1CgFfoYn958X
	 qJiBjbvqx86Qmv+VkQBK0RnEuFrN7zqU8a2+hU+3OTFP5I8ltlZst1deAEZHKZe2Gs
	 Bc8ueAdkY+y8uDJtD43CdNyz5xJtbZUR/BgpUNrqHcHbpULVP8WdCtJU8XbeP6TRZ0
	 6/47z1uEsXRVtc1Bs60o9IedM2z+nm50z+qfFjBo26cavoE8E9wEDKRQMWPXeHM87e
	 Glx3H+9cUiBQw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51f45104ef0so7674533e87.3;
        Wed, 15 May 2024 07:35:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIKnV5ERSn4k7gbAnNo0AyQGxecom5fyClOTsrkBnYF0U001MSj2jKVaQHOj+xjK6qsEpe0+2MgCiojRZjCdZvPFT0oYWv+ap72juf5Za6kdoRR5UXXOvMrXWCqnVXjTiZDTGvDnFm6g==
X-Gm-Message-State: AOJu0YyMe/iiCW0uV41IXdiZzAnIgNw71o16l4Gkq9OD5Pnw5VtusayV
	tADjAoCOIcILj5oLOJWA++N6COSIDCGdmoFkKqxsDyyjVPlrzcKKh+hedZkmb+xS+kzBUy9VrPJ
	Vq/j5uvLgyuHLS20d/p71T4XEjA==
X-Google-Smtp-Source: AGHT+IFGm/mUgF2lavM0/HOTDHvYoWP1j2Wu+66n9dm9uimWWzMapQeWvlSV9Algwaj352U1GMLrTOY8vCtrzatKHn0=
X-Received: by 2002:a05:6512:34c9:b0:51d:7d4a:5e6e with SMTP id
 2adb3069b0e04-5220fa71c80mr9178379e87.3.1715783700423; Wed, 15 May 2024
 07:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240515130139.2da899c0@canb.auug.org.au> <20240515135008.GA450088@rocinante>
In-Reply-To: <20240515135008.GA450088@rocinante>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 May 2024 09:34:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+1bYtSm_eTAo9q+ZS3ZzODbnkiCRNa6tOLU5HPUfny8g@mail.gmail.com>
Message-ID: <CAL_Jsq+1bYtSm_eTAo9q+ZS3ZzODbnkiCRNa6tOLU5HPUfny8g@mail.gmail.com>
Subject: Re: linux-next: duplicate patches in the devicetree tree
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 8:50=E2=80=AFAM Krzysztof Wilczy=C5=84ski <kw@linux=
.com> wrote:
>
> Hello,
>
> > The following commits are also in the pci tree as different commits
> > (but the same patches):
> >
> >   15be4f7ce5de ("dt-bindings: Drop unnecessary quotes on keys")
> >   28081ebd17fb ("dt-bindings: PCI: qcom,pcie-sm8350: Drop redundant 'on=
eOf' sub-schema")
> >   649bad67d4b1 ("dt-bindings: PCI: microchip: increase number of items =
in ranges property")
> >
> > These are commits
> >
> >   d7890a80e037 ("dt-bindings: Drop unnecessary quotes on keys")
> >   301e978b9eb7 ("dt-bindings: PCI: qcom,pcie-sm8350: Drop redundant 'on=
eOf' sub-schema")
> >   247edade4b4b ("dt-bindings: PCI: microchip: Increase number of items =
in ranges property")
> >
> > in the pci tree.
>
> I took the last two, and dropped the first one, per feedback from Rob.

Normally, that's what should have happened was my feedback. That's not
what we should do here. What you've done means we *both* have to
rebase our branches. Since we're in the merge window and I've had
these commits in my tree for over a week, I think you should drop all
3.

I only picked up the PCI ones because they hadn't been picked up in
over 2 weeks and the merge window was approaching. What's going to
Linus should be in linux-next before the merge window opens. We're all
guilty of bending the rules there, but that should be the exception.

Rob

