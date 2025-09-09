Return-Path: <linux-next+bounces-8243-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA9B50308
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 18:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E0D116F638
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 16:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E3E19DF5F;
	Tue,  9 Sep 2025 16:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIuIqpod"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CE18488;
	Tue,  9 Sep 2025 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757436392; cv=none; b=NNOHNH4BLnmycH/kvu7LUKx6sZVaA2RhU0Lm033lygG+gKgucAoNvYYBjgkoPjU7FfgRQ9QLXU5zZm6fVea73YQ2jF2DoOwfDE+WrQp32mvZ3OKNcB7s6iGmn+QrcOuxUzKW3Fkp4wTlI/wMs+BqFfJGm/gHPMvAkNcbQEBk3PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757436392; c=relaxed/simple;
	bh=McOLY1YDwRT2PrZTb+rvS77yVOqOnEBtd456LAor8NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFWfdwq8PuvfLLZjZTampOiczO7S6GwVVFfAd3mO9swnmw/vU7Co5f5SuGiOsT1j+Pi9xXe1RwsVIZdvxUsPXx9uyvb/cU0SqJqdb+egSPMlVtNkKrp2/DE+/LsAQdpGYPx/o/jh/LrbBbfIGIjko1DAlFeMxMSb47iM2YIypo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIuIqpod; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-25669596921so22324595ad.1;
        Tue, 09 Sep 2025 09:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757436390; x=1758041190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cMr9cA7d7nelqSgn8CROSXHRI4z/nGrk04sahtQcdg=;
        b=hIuIqpodVYoi12Qso3oNpa/PLXnPPfrympjjDvj/zXaH6tngJLZaC+s5hXwKtmu0Hj
         /Wlnz47AmyKf5u80SDfGXkVt/Rvjn9lPGrGmyDz1QKRhJJcBg1qTfUHegPrsQb+MdRdc
         Jk9zreDbCyu4fiY+htCqiHxnFHtGdfrtWJ0YPCA7APQmZ0LbkC7PXdnf2o8fPMDX4vwf
         82RER9nw2z+SGOfaiDPYEBR2C8TOPPpWhYlfdXkPgq9MomrfgUheXrG96NMkDijz10LO
         xHWfHvqLzvRZ4uMOauFifh19Qih+I5UlqzYCJuOJ3iP7D+IZLi6lrB0ua8qpaRwKWRRj
         tVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757436390; x=1758041190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cMr9cA7d7nelqSgn8CROSXHRI4z/nGrk04sahtQcdg=;
        b=qmzs/2QUpP/R2da9U3sFcYlppfIDaI6/VMZIIbZyzdRk2ZYkzWRx1VsptjvO97v7lM
         YQdVLDzQ0UpxaRT94X/l/hLfpoy9FlOroQrywtxvK9cm9coCRWokwA2txMLWco0oryXZ
         KU2BsDc35Q335wJUbLnXPoOUd5XPJI5RiBjcwWziZact5U2SS90mO89URrzxWQ0h/TAo
         dibV926eFoALZybqvIMzlRg6zUjVp5CPQhhihcK7DtqQVUxi2ksDkjuWdGVef00QhYJB
         KxTOXY1bsfGCTH9AIstT0+SUpilUEuO0fs/6KCRdC7TjoakNCTQq74eYC49rljFhthO5
         NDgA==
X-Forwarded-Encrypted: i=1; AJvYcCU9cplfHzsAOtInnmIIu4BnNQX/hxby4xRy5ppG4Z8pNx3BPP4HTQ/Wm86TWwVHcpK0wx+bmZpP9ABwCQk=@vger.kernel.org, AJvYcCV2ZBhb+FWNkVklddkocedGp2L2XSXWQRS/YXL81PAiqO4xTWfYI5vBBB5KPBiKFoanfiVdmoDgqR0+vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeyOzZY5KSfs5OeO7//PJHGBb+OKwEmKuZek1QjRlNHBDs/dxW
	wUXiaDGbjriKIljoJB+SHi1pSnHx9CmfgpLVFY3OS4utdXo8nf49RgZC
X-Gm-Gg: ASbGncsTWuJGB2KL2A/Zsjs5bEcv4aIdF3205IRj/frKQ6Fg/cp9YBWGt/sSsjQ3H+4
	xon9WNZHpc/NloT1BQxuRnggVN0oTZY3oUtNJK3drI/IbHc/Se/VpvBTyRs1mMbV1GL/LoaLR0B
	50dIduhK1aHlzckaOdVjWF9oirRNPsO6DY+Lv9UfW8m/XOBasRdoZRr2UqrYRDLEG/v7OAGmxmz
	o1S0RXRfN/CPP4gQEl5afBXl6vr6qItuJz+uXDwFO6WX7X8hkNgdk2dPnaqn40H4zmafQo6rdUH
	C66SlG0h+jm9juYopPzZjP+LiuHocn4Pu27l/50yi0Egw0NC1+Rn1f7NDJs2jeF8xHGHr5NTq8g
	VmiQwWpMGagfyAZYOm445oJ5npgNJm8C0
X-Google-Smtp-Source: AGHT+IGBgt2D+0I96SKJ0UkQvVRCobQF2FARNV5EWL/h66zP+2elkes67OKKODD6mqS0ttOCyLWG+g==
X-Received: by 2002:a17:903:240b:b0:250:a6ae:f4aa with SMTP id d9443c01a7336-2516f24000cmr160321735ad.25.1757436389900;
        Tue, 09 Sep 2025 09:46:29 -0700 (PDT)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2aeee2f0sm2314565ad.132.2025.09.09.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 09:46:29 -0700 (PDT)
Date: Tue, 9 Sep 2025 12:46:27 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Chanwoo Choi <chanwoo@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bitmap tree with the devfreq tree
Message-ID: <aMBZ4zTyMZLdQWJx@yury>
References: <20250908175135.4215c780@canb.auug.org.au>
 <5937399.DvuYhMxLoT@workhorse>
 <CAGTfZH3JyMGvjWni1Ge+a1=4nRPL30a84DCamj1AtXRLRMgzeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGTfZH3JyMGvjWni1Ge+a1=4nRPL30a84DCamj1AtXRLRMgzeQ@mail.gmail.com>

> > Dropping the bitmap tree changes of this driver is fine by me. I can
> > send a rebased patch of that for the next merge window to do the move
> > from the driver's own macro to the shared macro. The functional
> > change in the devfreq tree is more important to get in.
> 
> I think that you need to ask to drop your patch[1] on bitmap tree.
> [1] 414054a0bc1f ("PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 macro")

So I did.

Nicolas, please make sure resending the dropped patch
rebased shortly after merge window closing. I'd like to schedule it
for -rc2. 

Thanks,
Yury

> Before fixing this merge conflict, I'll drop the patches related to patch[2].
> [2] 7d9e29ed3f8e ("PM / devfreq: rockchip-dfi: add support for LPDDR5")
> 
> After resolving the merge conflict, I'll apply them again.
> 
> -- 
> Best Regards,
> Chanwoo Choi
> Samsung Electronics
> 

