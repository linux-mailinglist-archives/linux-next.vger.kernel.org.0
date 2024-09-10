Return-Path: <linux-next+bounces-3731-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F29069743A8
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 21:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 312B61C24E8C
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 19:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070F117B4FC;
	Tue, 10 Sep 2024 19:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="HrqvSguV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63DD12CD96
	for <linux-next@vger.kernel.org>; Tue, 10 Sep 2024 19:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725997567; cv=none; b=uphSj+S16VKGOUbMn5NiN0288wGVAlDYPTE2xz++rMDKVtSLjUyaUCDFU51Zcr7E02BIAynFzEI+BtIMGwKeUHQK9XJXLLESQV0TXhouHASOgqUB6ikhyzgCJHUPM2frLcguZnZskNsKyvEGvKmIvNrj+CP8JFDnv/0tu0NgPLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725997567; c=relaxed/simple;
	bh=QBqw6gziGf23dU8+1mGT+PEGoWX0UtdqDF+Lqa8STv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loGUU5gwPe68xepZBfJQplKVaRO5yKWh/y3b39DKoM0I1oToYjEojChHk0lmCiV7k5XU1ka4vq/0AV0zwq9ejhhcx+St4M6wK1Fkh48/KkrfuJj3V56cZFtUDRhUowjRj/C5KYL7/Q9ZiJ37mc/tsVWtN/vOoGG0gCcRju/vzSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=HrqvSguV; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e1a8ae00f5eso6122694276.0
        for <linux-next@vger.kernel.org>; Tue, 10 Sep 2024 12:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1725997565; x=1726602365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGMVJNuYVmspnlv8k2Ek+U++kVby1SW+hA87sFmyA/k=;
        b=HrqvSguVlwllJrbJOkxGhgbKfouCFXUk34B+t20hs5KGHb9Mxk4C/ZWuRiFYtt6ndi
         9fh9ppZ0y57Qetz1vA38qmUHXkXKpHNF68hEH35u3ZQcs9CFmY8nCe9CZu4mSnsEyC+e
         QHHvC4mOzDifwCcGZeKClKnAn7v09p1127uhWvXcvlEN2h1eRSZcN0jbuH58n5SPFexW
         /KPejj6dWHF2lqnJJ3ubmW7Zb+BlzKYgNl6heoVPAf73yWOpB6Kr2gQdY/o3poBmgMz+
         IhX2U/oXDqwgNhj0x8hlOWfT/nxkOzb32XL/pW/TBYjxlN0ErnN7bJU0XT5JvzCNpqMu
         AivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725997565; x=1726602365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGMVJNuYVmspnlv8k2Ek+U++kVby1SW+hA87sFmyA/k=;
        b=b1B7m8aRZWaOmz+IeG3CT4mxmZVlmOMpOCaSa53J2QZXMYF8N830tfnq4sKlR1wlTc
         OTfIYg4D1iTZockyZEx3QyNTfrBF8ur/DMvcIVW9U3dOYC1r03eqU753QLPLGWV4NBlw
         TpXF60po10JCVmLDM9CzPgM6REaE8nRDUCE101WpoCplzZ0mgheGnLk/Nc8IjGa9ZRxv
         M+afr59RzSSQCK6YSrNK8HS8lIJUWhplCD1xIVkV6RHz2yALCH6fIDNNgziHpVaT3ufA
         3a76egvC0gHfRbTiw3kdj4Yja00qX1ssT7Z39XOenhMTIyUZGltV5iY+7TymqPSwRHb0
         OPBw==
X-Forwarded-Encrypted: i=1; AJvYcCUlaQIilZtUme+KgjwMtbsMLdgv2tG3Dj30wzmpkQpzq/26aQiEfctHP1n5X1mM/r7qnbw9v1+casE9@vger.kernel.org
X-Gm-Message-State: AOJu0YxaQd6kY++2xn57VH1vIE+zeIQZAWOa9t5ggv+6fowu3QCeWgMI
	hqtvOKOMXe/j4TJuig1JwnNBsgmn/7HUzfUR5rNS9iiN/NtMi9YhOIIqRboXfwx5QPBM08wSThD
	ArhQKVfzg6BcfYH8v8x5XKl7B01IzkHOL1TiQ
X-Google-Smtp-Source: AGHT+IGEY6Db9V+HMZkh01TPbqGXgUQsNjb/9mYCmCy6WgYF3hmTtZMDxdx1lSISAmzW4RleXnfFtRWZYJ2FtLTp6lo=
X-Received: by 2002:a05:6902:1b89:b0:e1a:824f:1216 with SMTP id
 3f1490d57ef6-e1d3487fbe9mr17412009276.13.1725997564624; Tue, 10 Sep 2024
 12:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910132740.775b92e1@canb.auug.org.au>
In-Reply-To: <20240910132740.775b92e1@canb.auug.org.au>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Sep 2024 15:45:54 -0400
Message-ID: <CAHC9VhReKtzhTBbOxDWWeP7Tk=VoxVrYsLPt-v6TPCnwzKEiXA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the security tree with the
 vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 11:27=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the security tree got a conflict in:
>
>   fs/fcntl.c
>
> between commit:
>
>   1934b212615d ("file: reclaim 24 bytes from f_owner")
>
> from the vfs-brauner tree and commit:
>
>   26f204380a3c ("fs: Fix file_set_fowner LSM hook inconsistencies")
>
> from the security tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell

Thanks Stephen, the fixup looked from from a LSM perspective.

--=20
paul-moore.com

