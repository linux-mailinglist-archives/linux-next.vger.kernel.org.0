Return-Path: <linux-next+bounces-7650-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A258B0BC62
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 08:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C4891896745
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 06:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129141DE8A8;
	Mon, 21 Jul 2025 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="KbfKfSOg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D7125B9
	for <linux-next@vger.kernel.org>; Mon, 21 Jul 2025 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753078584; cv=none; b=ockajhxRCmKkQ6DkbI3p1KhEToHn1aeHafD5XHKKvvpNJzQrfnv+YopuyShK1V9DcBZzgOeaaAu4QO06r4Pchffpwdk/cv1NCHBb+YoWozLdHwNWyNLGYGBRD+Vpmfr35vxtG/MqdNe6NR5f1+pP47mKRusvy9NNoS6hXxNgcFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753078584; c=relaxed/simple;
	bh=GUc4zOTrw6rvLMO40T/UgBsKF5bRBvOA/F4vuJPWfyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHwpeRHMgiA6Chr2Mu9wZFvIPjq3oL2kRXudxhEmkuM8e+/rTgkivnxbH+mlOY+knH+zNjKQnc+HTW3dJQBwk7iS9n/Ew/ZvfzdKSKHSi9TY2xjG6V68uTcqk9Z8NR1SoBYinlsCwMwrlaAAPoNORVU0yd7//BJBnN5l+AvHNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=KbfKfSOg; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e8d70c65abcso2892396276.0
        for <linux-next@vger.kernel.org>; Sun, 20 Jul 2025 23:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1753078580; x=1753683380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bc+8d30/lECxDA4kACxmWGz/FYGhtz49xv0EhBIV/+U=;
        b=KbfKfSOgF98uCcn4z6goauXqL/G1n86qKeBN37hdjYhK7+ELcSV1Q5wSrmY4zx2nQT
         WwVNIxUJwSo2WMpeoZuYEIV6oFxKSAAMz/IRaIai+8UBMycol1P6+2NRwLCdepPRZQ1q
         f939z2BFKRRB6M0qVTZANABM9SeMZ8iB5+8pqS9vHMOgCFHe8eFSaV++ud91Ynv0TrGa
         XNuNYD2Ar9ZiE+UrxU8opOQgLzylStb9zTlubEGMtVuyLO0/rjNKejYQHHxSThYgc4et
         5vCfcJ8QalPROWbC3pX4slldKFFh+uj6d0MYaM6xuMobQl6YQ8501fpr0DyMcl+JUp1W
         GXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753078580; x=1753683380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bc+8d30/lECxDA4kACxmWGz/FYGhtz49xv0EhBIV/+U=;
        b=BBxIgq5vvoaIpZYCasGGe25Fh2G5UvjXYMUBE6v/mKYm3HblJbsVYaqFmNp7Pi6cVD
         WpRo6Su/9g3isb95VRtKjoKdB85raxYq8VVSl3soXNXYCXQgbz7Yj+0iDckkefPV6WvE
         89otjkwsRgUeSQ+kW6HP3NO3110n90S8NiW8k/la1qbRu6svoKwkfHeKMWVlEVI4vIRi
         BmVhzuDwUjfK/lBF0tpHyv8x4vvG8cJyqRKhLBGAQRlMHefgr/Ai9PMmtOhN7Xu7zhbC
         2cESd7gQaPWBvk2nI2J7dpH5NEhpN9wACqo0feQmfi4xoCzn3X+0x9obIdUMZItE5WfN
         2q3g==
X-Forwarded-Encrypted: i=1; AJvYcCXj6CEGcHTtlv0xkxe7WzM4geEvufvQV50qsT3FR+sfKhjdRLa9yDQrRPdfPghZ6uq0bbdRWqUQWAlX@vger.kernel.org
X-Gm-Message-State: AOJu0YzBm8n09GYRiGMAB/ClIEewwV4nDIt2WD9bO2XTH23+JlUyOQbp
	NgIMo9gMbZnPe9kUw51lBrvqYo2F2919QLh6LqG8ayKzbj/5yQbFcjSMFkACZ9mM6jGxR1BBc+Y
	F0TST9tL6RayfRDvmX3MIz3isuLEq2RYoBik9AooB
X-Gm-Gg: ASbGncsnJ6FeIw85mNWcGQdBhlh7lgs1osstmQ7rqDSQBQkYaxSzPxJxkUNFJYzhS6X
	czuTAZsKr/qrIVBoIadS92sXtk1DL7Ni58A2sjFzKdTRyq4fWa04u0UCgI8IgmQSdb3nlmuZWt7
	8eoJZSlkEP/eClwoar+BuXM3UL2xDoSMu3m9OmTf+goMSYCug9iw3OPXKspcCq36mxJlkvVQ/ld
	qP/cRZ/
X-Google-Smtp-Source: AGHT+IGRwpf25+vUlulE6Wz5IyRHrtuPkjnRo6VB9vcyy4Fv6C2MEkl6YVAFLufeirWkbUWkkmEFvWg2NDdISthx/g0=
X-Received: by 2002:a05:690c:8690:10b0:718:38bd:bb45 with SMTP id
 00721157ae682-71838bdd042mr172589917b3.40.1753078580164; Sun, 20 Jul 2025
 23:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721123801.78841075@canb.auug.org.au>
In-Reply-To: <20250721123801.78841075@canb.auug.org.au>
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 21 Jul 2025 08:16:09 +0200
X-Gm-Features: Ac12FXxxVJYG236kfXwBQl9DCO3Im2UTmjoaPG9PJPEy64er_QDNkUdsVy8NSYY
Message-ID: <CAHTX3dLHcQe3aZ8aSyJO7KuidbFzB5Jcb_=EcEZL5D5=btKw+Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pmdomain tree with the xilinx tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen and Ulf,

po 21. 7. 2025 v 4:38 odes=C3=ADlatel Stephen Rothwell <sfr@canb.auug.org.a=
u> napsal:
>
> Hi all,
>
> Today's linux-next merge of the pmdomain tree got a conflict in:
>
>   drivers/firmware/xilinx/zynqmp.c
>
> between commit:
>
>   ef32394c6d34 ("drivers: firmware: xilinx: Add unique family code for al=
l platforms")
>
> from the xilinx tree and commits:
>
>   3da405ead651 ("firmware/pmdomain: xilinx: Move ->sync_state() support t=
o firmware driver")
>   29ea33866d6d ("firmware: xilinx: Use of_genpd_sync_state()")
>
> from the pmdomain tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.

Ulf: change in your tree should come first and I will deal with the
fix via my tree.

Thanks,
MIchal

