Return-Path: <linux-next+bounces-5481-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E6FA39E7B
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 15:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8B83A3448
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 14:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22B2269D08;
	Tue, 18 Feb 2025 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhCMfjPi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5021D23958C;
	Tue, 18 Feb 2025 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888198; cv=none; b=K6+swqSUDbLhO1330Y4bR05ftvnNDfNOzJUoyz1ljHbCmozOqhosgxm0pw7ecihYfEzX0MMUOs5dMiHn20bXgOOMNvu/tSpwbav3UQUV3u2jv/PCHQUznW+WX8UvOuDI0nxKFY7Du/I6nPRiFYS2Lr/M22zS5LqIY3uPPH+66Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888198; c=relaxed/simple;
	bh=Q0z9FjYXWyIXtaEzCZf6FVqFshEIJPiN8uoO6wxcv3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ku/eALEeUqoAGr3dlUt2QtsYCMIiZpJ55ajEDkd9Mxjj5ANxI7D0jLO3JVb/gBBinT+KFGnrVbhqGf4dXic/JObSUI7oNbxMuFKiMvxxLLiIaVhW5iQA7pA9vq+Vpx08+J0AGmcKZgQCQlQhcrY31KE0i/FfpWLaLKfL80eP1r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhCMfjPi; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso4300542276.3;
        Tue, 18 Feb 2025 06:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739888196; x=1740492996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J0llu5YB8AGoFH0I5kYKDvWCJis6mleBIejl0Ej5nZM=;
        b=hhCMfjPiUmDEY+2ZCO96T9B9qhUzydJakDElk/DhcE0Q7lCMdIi38Hl94ngq99mnvb
         ihRiuOmk7L90a7cpSrkD8CE/34j73q9J1mx0E4Orc2Bbg4PICFXTCKTyWQFe0c3qmgnc
         L0ZJzJz1x5d8+UwKUQVF6SNNxCta/hfEw7wNizsq8a8Grddo5fTZ0ucnZkiWgdQSrhiO
         MouXcMb4VkAPovJFBLZU566GpKNA68jIrKKD4pIRLU8VqBQ5N7mD4w5QtaWtNKGJ6v7k
         VfkpZ1vQVurOQXljP+baKjzMcO88DRfNgMWHFb2UGyOT9mofdVZAGZCV3fnLrqGL7+SB
         ENng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739888196; x=1740492996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0llu5YB8AGoFH0I5kYKDvWCJis6mleBIejl0Ej5nZM=;
        b=R6VHrZzF1vv5QJA5KPBZh4swih06X0QwanoDVWNvCeAm4IcSXv6g1j35S5QL6lzcU3
         l/aLrpjiC+4GICfDjaEJwReleIFkPY8goNmVlJZISiCHKHOJhkZw7oM0HDM2G6it5m8f
         PxF+EgudwWZ2hY5h3yzfOyBIAPB5yE6r3O/uBcUS/Ou/AkHtt7Kk+0lxxWiLIoVSa5xM
         NuEA4/WgarsWE4smUPRDrSnzsyJDv/OeBcaafQ5n1rXgXjjc1KJWmtyE/+IgsJLM1c8E
         SdDMlnW+WHbMKLkjlcR0whhIQ/SLvWjiKZCVElLWBI3KCBsiPw+B6c7KtJv54zAKZrST
         jDoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAUPeZFUAuJ8m9keVEecKSgwZ6OJs3KsxT69EpKsSFCBxdVzNqYw3SasaHuD2wadquz1Lawf3XhUF16aE=@vger.kernel.org, AJvYcCV4FMIasTopKhsNBiW/zlBusrtd31I8NA2z8lHSh7a2XzkE7ZQhNyhOL+Sb1QSqJCMd5ShddKSF16yhyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPO7sDdibAsZ40yu1uL0YnCp2A38oHt82Mkx0QbwOLekHbs7T+
	vwmYZ4Lmsz9MLA+Xeu7yFSLIxy3XzvjnH2c3rNQ0M1p5oDxNUwccNrAXsSa3
X-Gm-Gg: ASbGncs4T/BNokxUi5wF/uPV1+ltaqenIahaKINhHJtlzpGyjF7m9D7gbtPbPBwqL5z
	qJ/aLeexZUuyOLfdQvnMDe311CQoX51VjzkF+08+n3M0IRHZEPvGz7dNX79IKabshl9eKrTbiZ7
	0/c61VkP0d6U0Ac05k9UvN7FO3DzLvxKMLmq/DSCAoSYyBsGsxV/xaYPCV54N6WOAhOKj0ibjtw
	ySTYiouCUmC2rdS9Mvfb93lTO5Yy568VMvwZejKuD3YOBGEmI6BI4erDX2z2MAJDi6nFzJS/THt
	nN83spE8ZlwllbnhH2vM0wloZgtHhWMcEdEOZPNMw2C+Mbk6k54=
X-Google-Smtp-Source: AGHT+IH7nd0t1Q3cNhxJjwGpKDAwBG18APeeJ3x8AEDKf8Pz6YQOczjRk4Y46gYPIsBPF8/G2jt/PA==
X-Received: by 2002:a05:6902:1a4a:b0:e5d:afe5:8c2b with SMTP id 3f1490d57ef6-e5dc9045af8mr11419017276.13.1739888195864;
        Tue, 18 Feb 2025 06:16:35 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5dadea63d6sm3040662276.13.2025.02.18.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:16:35 -0800 (PST)
Date: Tue, 18 Feb 2025 09:16:34 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Beata Michalska <beata.michalska@arm.com>,
	Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <Z7SWQoO2Upm_sNNx@thinkpad>
References: <20250218160742.49d6ab76@canb.auug.org.au>
 <Z7RiVtunqI9edfK4@arm.com>
 <20250219004934.46ace766@canb.auug.org.au>
 <Z7SU0THZ6bSG9BKT@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7SU0THZ6bSG9BKT@arm.com>

On Tue, Feb 18, 2025 at 02:10:25PM +0000, Catalin Marinas wrote:
> Hi Stephen,
> 
> On Wed, Feb 19, 2025 at 12:49:34AM +1100, Stephen Rothwell wrote:
> > On Tue, 18 Feb 2025 11:35:02 +0100 Beata Michalska <beata.michalska@arm.com> wrote:
> > > I'm currently testing a proper fix for that one.
> > > Should I just send it over as a diff to apply or rather a proper 'fixes' patch?
> > 
> > Maybe a proper 'fixes' patch, please, if easy - otherwise a diff is
> > fine.
> 
> I just talked to Beata off-list. I think she'll try to use the current
> for_each_cpu_wrap() API and avoid conflicts with the cpumask_next_wrap()
> API change.

Hi,

Yes, for_each() loops are always preferable over opencoded iterating.
Please feel free to CC me in case I can help.

Thanks,
Yury

