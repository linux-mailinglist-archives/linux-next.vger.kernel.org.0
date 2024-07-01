Return-Path: <linux-next+bounces-2765-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B56891DD14
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 12:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5221C2187F
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686AB12D744;
	Mon,  1 Jul 2024 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VACvhyRE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0F912D747;
	Mon,  1 Jul 2024 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719831069; cv=none; b=TEnbf0szpIvrhN6i79ACVg+TOaBDcTvWvltpp3B6ujSD/YH8+vCwiSy/PAqgQP2cLBB06IGECym1yFsvKx3n1gtbBOwKtG4kkIZUAscN8I39bX89BZRc7pkjXTjxWGBSA5ZgKIsT6GraeDyw2aMvIthaPGQLAi7fy1DmgYe93LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719831069; c=relaxed/simple;
	bh=Wz/AXBWmeXubusQROwvH3blo2TOXdRmWYaw+E6KGgIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StD5PycMW8FTW4+Ay+po0hYNT2Aoi29MqnyZf2SPMnoQsmYGZxyJHOegrprZsmScKHSgW1ydU+D/UABZueD017yWK6TuGZvcxM1IG0hJboO0H9e+mcNxZNYf2aha2IJklfbT14ARtowavPpvbNOGsQcymy/ar+xD3ixYH8W7XD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VACvhyRE; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-25cc6962c24so1269627fac.3;
        Mon, 01 Jul 2024 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719831067; x=1720435867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pg/z2yi3QLYK0ChK2eEKkIMHVbR1++HdVfOjxE3Io3w=;
        b=VACvhyREABrkz080TcyW10HKa4BOstTWPPUHgOiNapTDxZGNfe/+em5Lqfig1VmYl6
         Trr4vBTL/E45k+Ez85RzpC/oOWfMRGuTttsCVk/W+oFrg25UXLi5f16JFzgXqKDm+G59
         H21PLkRvOYCgMpPsGO7n/rT+qUITgBnt1RHKMiGJVyAeg5gFJsVoBAtoDxe+djz+1RJ6
         4TQ/jib0kUfnA+o5a5oUpUw6Cvp9jHTORLlrBWq0Qk9FBE5k4Ik4NfTGeu///rsd9HQW
         ncG/BnCykr1gXQyO0t3+sLbX7ZKsbzLYdcZrWujc3N/P3N2nUe89HqSDQULFCFupF4a5
         UwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831067; x=1720435867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pg/z2yi3QLYK0ChK2eEKkIMHVbR1++HdVfOjxE3Io3w=;
        b=UlWSIVmFDPEgnBeUUCfD8j6cU2eJGy+JINIWvmmZ53e/k67i9sQzmpWeTnzmTJalGS
         JrTumLKI409C/aRZ1UAxqUCvn7e4sMHBGftBQAFSSvIRJ8S4V5X20OtFg8XJ/Lm8GoJm
         JeUuMJbpN7Ay+gtvKHeZIUJRkkVeTRt18KQxIRLkfWYTacQOj7bxl63qjuVeJil1roJj
         55unwoITMdYQka33s+18DyjH24b6FRBXB51P3WJitRpolwkGSDF7aeGuLV5IySsKxK3e
         oIzYBf6hWt3DvQi86Q0Gbi4r1M1UuF8I3c0N/DuJLWlqrmkyKNQOVpY3zkN7Eyr2inQN
         /1pw==
X-Forwarded-Encrypted: i=1; AJvYcCULVVt+whj9oF1hycx+GYKnDOOpzQwP3w7TL7AwqAONJvQJ2tIrjWtgP3fYM7xEMwpzF4EVlu0/GOYYG9UT+c25/Sx3vOqtzyNQxMnFLwl5k2Eh/e12ETXXqetbc3PYDar7EWoyPx2nJQ==
X-Gm-Message-State: AOJu0YxE1ya1sY7nEAJA31SBuhHT0AqICxCM5sFFgYaO4hdLMBtj0ttw
	W9KLjHmi2O2gKkDszuCj5g7rAmMHWFKNzc2zvft2nvr+e3ctjjWj
X-Google-Smtp-Source: AGHT+IFRTnrqPqLUc/6RdDDKowRJeZA6y+M+PijtdrqyXUdWwkYn9KgsuD598WiNwF5yN+hbKcM/Qw==
X-Received: by 2002:a05:6870:1794:b0:25c:b834:7481 with SMTP id 586e51a60fabf-25db371e196mr2733643fac.56.1719831066704;
        Mon, 01 Jul 2024 03:51:06 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a97ae3sm6191955b3a.206.2024.07.01.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 03:51:06 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 249DA184B18CF; Mon, 01 Jul 2024 17:51:03 +0700 (WIB)
Date: Mon, 1 Jul 2024 17:51:02 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Borislav Petkov <bp@alien8.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] Documentation/ABI/configfs-tsm: Fix an unexpected
 indentation silly
Message-ID: <ZoKKFq_DvqzPByfe@archie.me>
References: <20240701184557.4735ca3d@canb.auug.org.au>
 <20240701103451.GDZoKGS5klAmgmXI6s@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YaaCJ5I02yvgxc84"
Content-Disposition: inline
In-Reply-To: <20240701103451.GDZoKGS5klAmgmXI6s@fat_crate.local>


--YaaCJ5I02yvgxc84
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 12:34:51PM +0200, Borislav Petkov wrote:
> -		Currently supported service-providers are:
> -			svsm
> +		The only currently supported service provider is "svsm".

The wording LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--YaaCJ5I02yvgxc84
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZoKKEQAKCRD2uYlJVVFO
o9n0AQCE42m/V43h2+Al2QajT23KaMYiMjLySACf9zqn3RAoDwEAhTrsAYXtluKu
UZHLyCVlO/zZGD4uubSTUEEFNo8oVAA=
=dVz6
-----END PGP SIGNATURE-----

--YaaCJ5I02yvgxc84--

