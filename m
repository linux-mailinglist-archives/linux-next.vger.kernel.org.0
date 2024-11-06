Return-Path: <linux-next+bounces-4630-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C68AC9BDAE0
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 02:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D1061F21A66
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 01:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEBE171658;
	Wed,  6 Nov 2024 01:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOqu8OIw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC315F3F9;
	Wed,  6 Nov 2024 01:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730855082; cv=none; b=Kdh1PGwt72HvwfhqS8ygLdoM9vACUE/SMM/NgpCJbGeJTlkRP7lmbLN0GuJupimYXMswCsITb2thyS+Pucg65ODi7e+5L++QFrZzE+hle0F5TCTyCG2jYjK73J1wqxPpaulEEw74z7vL/Cw0mm8zmoJihMigXR9jKU7Po8lB1w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730855082; c=relaxed/simple;
	bh=mjiG7yzrzKld24ph3hp3ihJU4px58JoHoRC5FfBhXo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABCrWgjlgf9ZoAOXIyAl5xAJfoqNmFMqeWTW4POOYxDpxmMTy35XZ20uufGvUEM5qZ7/mWH9E+jBstjWZS5nGfjjyV7m1RUJUNZ0nby8lCOaRls3f+20Eb2Cwwgelo8o2T6Ulg1NrAtwdHiKTnGo2vpbOinH1xRkRGy/LIGcuto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOqu8OIw; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ed9c16f687so4258950a12.0;
        Tue, 05 Nov 2024 17:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730855080; x=1731459880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mjiG7yzrzKld24ph3hp3ihJU4px58JoHoRC5FfBhXo8=;
        b=ZOqu8OIwi30GWC6vRll6pFSYMNWYAJU9nYSePF9QXAG42gF3O+3qfZjl2RVQcMksuK
         uKL9ZQ9prUJDH+pQdvp3LEBwFIGqVVuJq72xY3zuKqOgG7/cEHy80frAX3fd7TtMcszy
         GCi2ucUgqAiJApID7NP6lMdRNqJAcgxZZEQtKb0nTPtok1yY0/9Ef9ci2EHdiQjWUh8H
         QboQjCkDdtcD3feF2/eB3kOFZSkK8JYHlNGSwjYMzQzvRv38G8Ry0j9z8OYgrb+X9r2I
         AQ+pBPcWYkaIuC+/HWP8LoS2XmylE+gYmswVKjD1OqKm+BV9oMSNf2NPkCe8QlGP1sCd
         ltJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730855080; x=1731459880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjiG7yzrzKld24ph3hp3ihJU4px58JoHoRC5FfBhXo8=;
        b=YtFjhyHLSljxn3Kal4vueUNoCdoG9/Qb7aQhcdK/YHHb/IrB5WfM/UR1+JaLb3bM6H
         ulQM7ORhQwADc/aww3idnjTebPM8XavluKpET2NlUuUJM7cMRfWOtFDPMAkwXaufNbJe
         wKA/mtybNFGh2b6Ulu6DAoeB/Y3CHtAahAL4YKHf3jjKbP2wequAoTfP/bgpj8yVxJQ7
         Q80Zppq74dB8sdHEhgwxFfx3TN15Y3Z8puYJtHD+W4QTzqz8SxwXFCzS9pYcdk0JU3Xb
         cRNmbwWp/eM/aF3yFt4400l84NTmPhky7DY075h5CnqaZdFKH0amZ9kK28Bab/RjlEpC
         J3+A==
X-Forwarded-Encrypted: i=1; AJvYcCUKUtMtaxqu3czl7jpupAIcdOnxBSUxe/oEFTnhfJ4bOFfddrWwD/6dQCZiBwDjxPd7vHoSDKimG132ckY=@vger.kernel.org, AJvYcCX32YIxRAiSGNtxFiOhHTzo2DmDofX0diI/iupeo7sVdYuT0PFmvKo2BRg8nEk7m1bUO8SfA8QYXhABjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdn6TTCJsKiMULtPjSzX8bxFUqnpbRKlzuuw5yynF6FzJba7es
	5xvj9ZjXFS/JdKFQNntEYPDfJwmvGclWRs3TDBJt7tVwFK5q0uXG96Fjng==
X-Google-Smtp-Source: AGHT+IGbScNWgMSMeTsvZUJxM/sFrup+491cXVON7ajiUkdfwIR3BIA5gdQ2ViGlzWPslRmiqzW6Mw==
X-Received: by 2002:a17:90b:2703:b0:2e2:bad3:e393 with SMTP id 98e67ed59e1d1-2e93c1239b8mr27764182a91.3.1730855080063;
        Tue, 05 Nov 2024 17:04:40 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c4e95sm85235265ad.225.2024.11.05.17.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 17:04:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A775A4230C3F; Wed, 06 Nov 2024 08:04:33 +0700 (WIB)
Date: Wed, 6 Nov 2024 08:04:33 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] docs: bug-bisect: add a note about bisecting -next
Message-ID: <ZyrAoWSF9KXxtuYL@archie.me>
References: <ec19d5fc503ff7db3d4c4ff9e97fff24cc78f72a.1730808651.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Se/6lpB8AFTzTZV"
Content-Disposition: inline
In-Reply-To: <ec19d5fc503ff7db3d4c4ff9e97fff24cc78f72a.1730808651.git.linux@leemhuis.info>


--8Se/6lpB8AFTzTZV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 01:11:08PM +0100, Thorsten Leemhuis wrote:
> +Bisecting linux-next
> +--------------------
> +
> +If you face a problem only happening in linux-next, bisect between the
> +linux-next branches 'stable' and 'master'. The following commands will s=
tart
> +the process for a linux-next tree you added as a remote called 'next'::
> +

Has linux-next tree remote addition be covered before?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--8Se/6lpB8AFTzTZV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZyrAnAAKCRD2uYlJVVFO
oyJ6AQDq/kfOKTLIySQ+vgpBJxOBYJ7mok/vAvAT/o51FaL63AEAoMCkQI0q0hm3
uByGOKu7ItE1HqWb0xZwGineikDxAwE=
=A/XJ
-----END PGP SIGNATURE-----

--8Se/6lpB8AFTzTZV--

