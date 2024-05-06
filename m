Return-Path: <linux-next+bounces-2190-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C448BCC57
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 12:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429AC284EC3
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 10:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77E4757FC;
	Mon,  6 May 2024 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faoBhgNL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714C72BAE3;
	Mon,  6 May 2024 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714992531; cv=none; b=Wtwn8EpodhWqxPgizSZsQwor2SjJlWLO74+h8L8aa5tRV0TRS0LsVBgPX/krm9mres8KqYLQysueaVTGWEfszUL2xRdCJw6ZAmQIme8NyJ8Q7RKEP1T54anxAMfWYJ+25mnJJ8ZjWgE2s2OBI4SHR0aVZPajHcUDhXmBY3ukFyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714992531; c=relaxed/simple;
	bh=ARJ23TKvLTR3WJAf6QdqBrxazK18M1dwucHinD9aSQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDNbbwXf7KQ7T7jneQo2lgBV4P9eHJ4lkPlyeXFE2p0ClR+POiIJEOv7BDTiwmGmQ/tHxQ3eZN3bdSpxgv3YTk3mh8RFUb0UZ9BCgirEWz6zXYJG/ajKECXf9Xy4N686Wnnn3/+nZmskPsJ7vM4wdDU4BJobHPpIwHrwOL6wvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faoBhgNL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1edc696df2bso11509445ad.0;
        Mon, 06 May 2024 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714992530; x=1715597330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GVtnw2cXz417fcLRGeO5sbYvgn6wv34FVlGvTsbbKFI=;
        b=faoBhgNL6O47g8dtm/JQBFq8bS/ftE/HEslqrp6icrT9gi4vX06mdOAz9kwS6m76/Q
         ta+q2+AM2QUSZMsXzp3CQ8k+Of23gYYxjvchs47bIbjalPAO6xPzdYPlARIWU0Lo2gCD
         pviNVR8Mj49VdAj/VqPMSirgueMSsb/l7mMnMYbYgdgzyuvS5m/IVyCQoEA3I+i8ymsK
         HPtW4b0DqAKxWXyvWjxLAZtvqzpiDhIg17iuT6D/7bt8pNUnmzXefwSwowl9w6lpmZXH
         1opZ1V2akDmIlExKBqU6AE5hy3livWWJPNCK6bYkmSYjEc5ftzaSVb9vfzK9xI4BSriy
         HppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714992530; x=1715597330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVtnw2cXz417fcLRGeO5sbYvgn6wv34FVlGvTsbbKFI=;
        b=YlAxq/eVZA1WrDtOZCuGCZfm75GIS5FfgH+jUtTYxeY8JArl3UJECXlZraf0fYcWC6
         NUHtFAJg1M6EqOXN5/ITcdOqsx5BFh64idR+3LRF38gabVhaUNI30TY1AzF76lMTL3Br
         IGa5B34VHOS7iLLxt+aD5O5oW9TSDQ1TbmZXbfrrBdM1Wgh2xUKp4W2W6VJQj5GeYj+2
         +8JixhclFyR+mktUwviP5mIPkFU3JyirKHM0UpnMpLqVJnI2V0CnSsTZFPf9uN3XyL6/
         3sHAuZ1FmbYTDBBzPFzaqg5fK2ho1Q1/pMPqBUjK/gI8f2P98n+YD/neD+HGpuaeRyU5
         qNRw==
X-Forwarded-Encrypted: i=1; AJvYcCXTeHo3/NjUlHUqnHSImwYgjKWgnJzJwzCZpYiQxIIZUS+qn1GTj2Tbgrgm/NoRTCM9odigST7VSNfyBMp1XEvoeOUSqJXjS1qaNeSTTsjSGDbpW8RLU4X8q88yo/BPuwU8RCbttDASsw==
X-Gm-Message-State: AOJu0YyHtZOIf0lJfobyjhoKnCZFgLXj4H7EPOHKekrygmp3xaHrbmLa
	9IzEQoS9pPQW1IPf/lKHJpEr1RBhk4eqSpS0wJrPq15SmsPkd1JGRXSFcw==
X-Google-Smtp-Source: AGHT+IGnWIsSRlAr5d3rci6sw7HXIGyd/+wJHXiy+6By0qMgyxiDSKH3XQIY+LjNyA3VTFAnuBa7Ig==
X-Received: by 2002:a17:902:f68a:b0:1e4:24cc:e020 with SMTP id l10-20020a170902f68a00b001e424cce020mr11777169plg.67.1714992529467;
        Mon, 06 May 2024 03:48:49 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id w16-20020a170902e89000b001ea699b79cbsm7972761plg.213.2024.05.06.03.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 03:48:47 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 61E69184790CF; Mon, 06 May 2024 17:48:44 +0700 (WIB)
Date: Mon, 6 May 2024 17:48:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tpmdd tree
Message-ID: <Zji1jB9xqOo3es5g@archie.me>
References: <20240506162105.42ce2ff7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CWBYFMWURoT+x7Ys"
Content-Disposition: inline
In-Reply-To: <20240506162105.42ce2ff7@canb.auug.org.au>


--CWBYFMWURoT+x7Ys
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 04:21:05PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tpmdd tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/security/tpm/tpm-security.rst: WARNING: document isn't incl=
uded in any toctree
>=20
> Introduced by commit
>=20
>   ddfb3687c538 ("Documentation: add tpm-security.rst")
>=20

Duh! I should have added the toctree for that doc when reviewing it. I will=
 be
sending the fixup shortly.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--CWBYFMWURoT+x7Ys
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZji1gQAKCRD2uYlJVVFO
o/dBAQDbpxSPpTnwtqWyTvsRwk3dMr3h2YVH+1fcetN+iLLebQD/ZGJ8uDPNaBD7
SYfgK6v58okFRbyDAJELeIxOR8OLcgk=
=vJb1
-----END PGP SIGNATURE-----

--CWBYFMWURoT+x7Ys--

