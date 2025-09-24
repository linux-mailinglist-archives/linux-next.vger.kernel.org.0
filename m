Return-Path: <linux-next+bounces-8465-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A4B98DBC
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 10:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E438B1630BE
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 08:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB18286D55;
	Wed, 24 Sep 2025 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faDMTGlE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD12285CBA
	for <linux-next@vger.kernel.org>; Wed, 24 Sep 2025 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758702357; cv=none; b=krFVAN1s6USnOccqb3z4/0539XdSbdtWZPnPUJ1E23yGZK8OTsAIId1ERR6d5GsIBYYK8GzDXurVxOl9hBfC+ihpoir9GbjvQfU2hlaWRKNvHvvYujqECCskmG7X+r82g0kE8xQAwNG6OHFvH20ZpzWuZgWU9simf4b46GI160w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758702357; c=relaxed/simple;
	bh=lFCQJZdTjFr6WHrK4DSsND1e5qvl17voBMG/j2Q2oIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAXFGJ7fawVqlstusnnqY1r/ALNWHDbEZLJefQ3gx845lx+8+RToUrBMgU/6emqyalsNjyC+5T5FDB4bK318ldIVm49pyLnF+qYt+A+lQZ3YlWhWpngAYXC1e4RZ7JszCeZF2tBUJ9GzdDRHS7MfwHWj6qr6mrSf7K/QnUgJguA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faDMTGlE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24498e93b8fso7044605ad.3
        for <linux-next@vger.kernel.org>; Wed, 24 Sep 2025 01:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758702355; x=1759307155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFCQJZdTjFr6WHrK4DSsND1e5qvl17voBMG/j2Q2oIc=;
        b=faDMTGlExaUjCAgePBBA0cG2qAc/ySLzmaB4WeRCcln1OARiNu1iLi13Q3XgBFYJhx
         zwgXAUVmUnDtB/I/HLc5REoWf+MwM/EoO9KNbV5vK98GUOPeTbwfk+Q16wQagTKnCq5b
         8fEEpiHSrpr0vaCXARmpCD0q8YAwcTE5lsP4JiqmPTXA/oeOUNmXA2/0sG9hPlP9SXiR
         KoUcvgZbqbNFLURRpsHgf2tAg4FVSF1P+Z+pYUjaptCLNK2N8w4X0WDJADFVxL3/sDDG
         phEraAkv//EFSPLPsAnmWrJXnVWW1enN2cEeIZU9CXzlEUsjedVH7O1GQTsA1+wjlhV+
         3ubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758702355; x=1759307155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFCQJZdTjFr6WHrK4DSsND1e5qvl17voBMG/j2Q2oIc=;
        b=a1eAHI2jA7UCYXsGPHytECBhjLbiM1ptA6KFmAfW9koRMLQb39MBkLJrVvq9kn5Mum
         jaa1NxcvtP71lBuagalieUCcwFizXIq/5FNvgMuDV4UCg+CTrwoG1e7QJi6NctyxvZUi
         9DCcNkyBUC9HKtvZeDwYGcv3fDfpJB6lIrWsnesoQatx4qotlCnWagbf1xWjcJ3WvNdj
         azWNGz0Tlwo0LRrQg2vzfBweuYw6WnlUfB5Gr+YmmW2wF92sOVYR2ykHgOH48id8SlgY
         ICa1r/3H0zFA/7BQJdvnXDpxPgB6SgNT5VWcMgBv5LFWxaBT+mboEuP9xrtKPwKJCcoQ
         hj2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHk1mRYGggaowz87oJRJBAkDjQUrZmbusAM9YAeaCwLpDMqWNKCzQB3e9xznu5Gg1/620BiE0jSV0+@vger.kernel.org
X-Gm-Message-State: AOJu0YzAyb9zOZf9QJK79xHOJqAdkHYxR3X5wkRMXWGdvMLXSAVcWRf+
	WwQmJpQNnIS3r0VZ+nI4uot7DlyHIfALcBFOQdcY+UdQ5zrMW+eFBFszhJXHdyhEbYbvVUYNnaG
	B6RzhL3ZNr+xI3F+bTk7+J7+5Ao5kXK4=
X-Gm-Gg: ASbGncurg0zlhmklRliN8cO6bhYC5BjDUb+d+J2hup37byGbs3x3PFAR1djUS9B3I8B
	DPVigV3PjQsLJhiFADxjXSvmxY3ldl69En1dYwYxqavnfM2WvwSVAmmXMmP+5S2k6pT3bU1XNgx
	hMFH0SIJDMrzgssVQtwlUsPfqK04YkerFYUTlBTZ6wiZavUjuQXrqFQiLKPerFeVgiV2t9Q6ikm
	AgbtKpAToIbHKqAH38DDseeJZHSVKgShPpOgXYQu/MMihTXj+O0dy+RvgrQ7lebtpAbeLAApxNp
	t14HNFGQT7ILXMFDDEeiJxE7zw==
X-Google-Smtp-Source: AGHT+IHX+JtOM/NNtNrxMmozDIcbtGijJS/zvmO5qLKiL3fxxj1Vg7iwYa19egMIszAck8PIgRg9YbI8g14g2Cwr2b8=
X-Received: by 2002:a17:903:110e:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-27cc94ca027mr42352355ad.7.1758702355047; Wed, 24 Sep 2025
 01:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aNLOhQyd0YmJnPco@finisterre.sirena.org.uk> <22591ebe-c496-42e5-b2f8-9ca4f8fcaed5@kernel.org>
 <CANiq72k6fioBpFam4YhHazS1X=EVGV8RM6Y9g7ecZG_0w2FA0A@mail.gmail.com> <aNOl-0O4ikg38x0g@finisterre.sirena.org.uk>
In-Reply-To: <aNOl-0O4ikg38x0g@finisterre.sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Sep 2025 10:25:42 +0200
X-Gm-Features: AS18NWCwc4AFEH_PANQBjMRcRUDCNZIBkz7VNlFchEcjVU9DdlzKW06bCXrE08M
Message-ID: <CANiq72nXFih9J3v2ZHmbadq5=BCpJ7RUTaN+h1OY_kWdHVGH4g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Mark Brown <broonie@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 10:04=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> It's the whole diff for the file in -next.

Ah, that makes sense, thanks!

Cheers,
Miguel

