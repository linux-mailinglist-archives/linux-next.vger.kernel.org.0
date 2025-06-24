Return-Path: <linux-next+bounces-7212-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0F9AE5851
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 02:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A85114C094E
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 00:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04ABFDDC5;
	Tue, 24 Jun 2025 00:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="RFFQohGB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA3DAD2D
	for <linux-next@vger.kernel.org>; Tue, 24 Jun 2025 00:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750723834; cv=none; b=S2wpcSZJXsar4Oyubt3oOw7HsT3mwynkeQ/2lEUEs28CJEBK+LpBhvvY9rWEWz/CHBvktexoomJHtoyz61XuBHgcTfm1l4Vjdas3ol4JtuNwY1g0iwEaSz9rs/lKCSu8VD+KI9rCZErDHjg6j8XK0LP4YC3fNRzbn+BVxFbZ19Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750723834; c=relaxed/simple;
	bh=e33mp/d3hsTBbgP/Ny+fGiGsNkFFlYRoee5U98FHGTQ=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=eauAkYZrfWoUr+qa1JaTYverqSGFShlpdJLCv4wTBxpL6O5eyhN5BJ8PLpYn//LyLP+s4nsPpqzKH6uXQqInpnA5aDawmoi+EIgfXYF7fuSXbiDxm9jzJZJessdCNORlizBC+0PSQWmEQEt5ghDfgnud3iZg34F8lW0Jx1aNvjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=RFFQohGB; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso3701791a91.3
        for <linux-next@vger.kernel.org>; Mon, 23 Jun 2025 17:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750723832; x=1751328632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwIH5Rinmz61XRoMBG+P82QRME1pYQSd4FCtYynYjPE=;
        b=RFFQohGBl0tm6PfFB170v/i66YPoG8MMPf4rz3OlNUH5rAf1MTzCYz+m1ydzvdpQdb
         +9I6bC6d3zdiDbpzd4rSXs5yaWBeCf6TkQ4xQxrstIDJXdQ8Bp7LkFBU3nbzaDpdWTR6
         m6r4ls0vCpv3kQQm4noPd33dMcb8q85QNG7bVUB5FA8rZ9H0Ih2BfgGP/66+EAeKK6Ze
         bIBF7ZfAoO0p9Ev6noUEFPvnZSON2AeD9Wii4Sw1o/tYrLaJBfoWVYZz5C7swwUSM95c
         OWGp/fEruTGH3HUp7VrG6WgdV7BC0E33B5WtygFv3mW6E+vtbbI17/anb9RYmsuOgMxo
         5H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750723832; x=1751328632;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwIH5Rinmz61XRoMBG+P82QRME1pYQSd4FCtYynYjPE=;
        b=OlJrDtSMBM+8CHX7rLZC/0tNX8tjQRD1eb0Jfj/S7VIe1X6VuKNY54gLj1TgJUhnzG
         OahvOOi7v4Hxw+TVhVI67m3kTQTPHSGW+XF29DhVaUJfR37CmLM2s8bTuUGu4fACdsFu
         iRpqiOwUdc6PZEN3uIGlSDTrFNFwoeAzpLDm+6IaUOCjlaaMkLkKzSBS7Lf10t+kn1+x
         FZA+5OXVuHyQ++cfNvJ0oJxv4TXl4qaeGSh/IDKeDGafg1rUp2bM12SIC6GvIoO4+r3j
         QxV+73JClTysVE7I2RWWqtOefEGByIJEX0NBu9ngoQvmKLCPgkQsmIfr23BYp72nRGul
         IvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3iH8wfI7BTBFgCrkb1WNc1J9Dt6gDHumpVzaRZREdS2YwF1AgWYoIEjYoCWVMXMgRgPbM8fkRakrl@vger.kernel.org
X-Gm-Message-State: AOJu0YyVA531g24r4DOOeeFiZldRjMzNKxE6IpK+Tq0nGYbmRyksOw2K
	bh3Q7VoSVNm/rjTbSFNBRKhGqFAR2Rrnb2/88OeaP3yo2NYB51XWHGbBzY2xcxKDccw=
X-Gm-Gg: ASbGnctqok5WNeH/ZvQ2YYY6JPJcM/wtyhrVeeDB4RRLCDs3w7JSXLbi3UHInnLsRNG
	zoFjYMWvSaXUp22m0Ouh0uxaa1uc44iVh6IkSn2cD+QywELkutSt8HXg2R1oQPU4fTjPEezK4Yf
	NpG3qF6u/xV1IonH82NlPi/uss19aN6QSqxFRxHqfTkSoMTj3gI+1MLqxJthta8k5UKR1zS62IB
	UTClKup9S+7V6PxAJfmfUfNfF1EZXAoj1FExQtAU344vpq0m3czInpp3Y02oosYgLSdcgUhpw1e
	sT3DbAKjz1uj+YDZT6DacxFMS8R8Hm6s7VF48HX8a/OOZEh9XBewqtNCVqB6
X-Google-Smtp-Source: AGHT+IFViMfol5Wo5W5fiV0qv/Ae4YNuk6o/gwais386gpzEpceWg9uNhGaXi9o2rdz5IpZWZ2IY2Q==
X-Received: by 2002:a17:90b:3f87:b0:313:1a8c:c2d3 with SMTP id 98e67ed59e1d1-3159d8c3e17mr20179355a91.22.1750723832187;
        Mon, 23 Jun 2025 17:10:32 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315cdf8d7aesm229777a91.1.2025.06.23.17.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 17:10:31 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:10:31 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 17:10:29 PDT (-0700)
Subject:     Re: linux-next: manual merge of the mm-unstable tree with the risc-v-fixes tree
In-Reply-To: <20250624100851.40f8b416@canb.auug.org.au>
CC: akpm@linux-foundation.org, Paul Walmsley <paul.walmsley@sifive.com>,
  fustini@kernel.org, duje@dujemihanovic.xyz, linux-kernel@vger.kernel.org,
  linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-B82EDBD2-2149-412D-961D-9B999FB009BC@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 23 Jun 2025 17:08:51 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> On Mon, 23 Jun 2025 10:14:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the mm-unstable tree got a conflict in:
>> 
>>   .mailmap
>> 
>> between commit:
>> 
>>   850f0e2433cd ("MAINTAINERS: Update Drew Fustini's email address")
>> 
>> from the risc-v-fixes tree and commit:
>> 
>>   a5d3f8d805d2 ("mailmap: update Duje Mihanović's email address")
>> 
>> from the mm-unstable tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>> 
>> -- 
>> Cheers,
>> Stephen Rothwell
>> 
>> diff --cc .mailmap
>> index 93e94b0b9376,60165a8144bd..000000000000
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@@ -223,7 -222,7 +223,8 @@@ Dmitry Safonov <0x7f454c46@gmail.com> <
>>   Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>
>>   Domen Puncer <domen@coderock.org>
>>   Douglas Gilbert <dougg@torque.net>
>>  +Drew Fustini <fustini@kernel.org> <drew@pdp7.com>
>> + <duje@dujemihanovic.xyz> <duje.mihanovic@skole.hr>
>>   Ed L. Cashin <ecashin@coraid.com>
>>   Elliot Berman <quic_eberman@quicinc.com> <eberman@codeaurora.org>
>>   Enric Balletbo i Serra <eballetbo@kernel.org> <enric.balletbo@collabora.com>
>
> This is now a conflict between the mm-hotifxes tree and the
> risc-v-fixes tree.

Thanks.  I think this one's just OK to call out as a trivial one when 
stuff goes up to Linus.  I'm planning on sending a PR later this week, 
usually Friday mornings.

>
> -- 
> Cheers,
> Stephen Rothwell

