Return-Path: <linux-next+bounces-6739-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF028AB53D7
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 13:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EDA819E7839
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 11:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED23128CF53;
	Tue, 13 May 2025 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+ySNwTR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2B244669;
	Tue, 13 May 2025 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135779; cv=none; b=S2HoKdw+soT02ZOq3QJO923mqTU+5doeUsTMcRRn2mXV0hlYgIr9bTSvN1qaBBONdLTjBXk48k57qHa/E2Pe34idkSc4A7PfUyxmMCtRser7DkPardQIVMIyG7bE/hcG614QgxhIDGYWo66fil7heCxT6wKKJlnzaJeW64SNYKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135779; c=relaxed/simple;
	bh=geVAwIDc365kHzkrUUgqB0+2vKy4JUrFQRJ6OAWoRTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqasoOz6AalEgJ83pckgdMUv1t9Z1Zq8dQH5sdR9wvMoQdV7rfcin58ITrIjh+/f++8JepoD9hvb46VurvGiiRfcwkYFUyetqk+GbEHMnjGgYkiulCKXVi6PHrfJ2yud0Qa8WlPe0bAO1Den5lubwRJOUhyLwTPgwQSjv7JOx0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+ySNwTR; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5675dec99so627719285a.0;
        Tue, 13 May 2025 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747135777; x=1747740577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G3XsZi4CpoanvPryvuw9O4BccAJOZlM9GymM/ZGrNAI=;
        b=A+ySNwTRAtyRmtsXLnHK31aPZeGg8hK0LYp1JH9emjfiWLqua5Hx3Z+XZYEH7iQow0
         EFXwmap6qxA9XacOGtja/PBKZT6kZwkasIKALD1ZQNjRavnKpQ8GC47Ua5cajuUmqkx5
         UDFitnvW9w7zKVvLG9oVEzPl8GTYNexXIDzGhVuoV8WfQgrKLs9NPk79Nm+6W40LjPFC
         zsrt/0kuET06EhP1dz/37Rn9JJF+ZVoyCzy6PybhK9JtfQqHgfjG86qIHqfGRuCffk6W
         nWvAegNtSkVRU2VuWixaUN5EMc82h/yaQzKNzjBlD/XNS2dENgKFML6crZi0/TrWucu7
         rJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747135777; x=1747740577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3XsZi4CpoanvPryvuw9O4BccAJOZlM9GymM/ZGrNAI=;
        b=uFN8LRxOinzi6BvAYxckpY+YgNnjrKhbnnSHdh/G4U5ORCsf9D9wmqZC354c0vsm6N
         I2tdYiLsVLr5TAxPOmc9E2VF55DgeV+HCLmSg7AO9zuZKExtdqqxIVt08GB7DhEhxbRf
         WEf1dub3ZOE6cJtjxJdMojfcDYNWNnoFZ6hyFAcL1U0N16Pw5blKoHOWJgaVkej2bH66
         8Cd9yII7alphGS9Lq9ZaVUOb1qz/DFcc11/K71sCWyHE6NsD6YtDLIUIrpl86/Wje2WD
         jL/XvKhH9EwqkMoRLNmGv95ckzsf8n9I0H00IKpEcneP+BtWoetjh9sYZUDVNT1qhQ2L
         aJTw==
X-Forwarded-Encrypted: i=1; AJvYcCUK6kEf8gdZC2H5bEizINymsVROUea9a2LaVrwMGAdaxxVLbU1FzmyGqWCqTpGVqJWRKBzaLBh5Rn3x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9cgK1TDrAPpotVc6E8fzM7JYFysCqDCeWGBzOEmLIBC3jDxK+
	eMTHFauKHRLAG3b9/HumM/ycVIlX3Hh6Armej66LDqI5/1BfCn+l
X-Gm-Gg: ASbGncu8lsvhLlsERJJ0yJv3+YB90X6T2y8txFgWNygGvdTv9jYTMwU6Eq9KZ7ARBHk
	nDG8ROAl5UVsLldkeIUqSXpUvFA+FbbI/AAl+tmnZZcWN6wIJr+yMYDlDO8q/8SkfnTy5j3eTuK
	e7Ul4Gjt/Npivg4b1cBHFatAdDifVIIDLrJjI2hOsammGxI0LWXwOagfcPiUvEEi3WN4N//0gwj
	VS2foDXAr136BQCTfgSqqfzc25c/R4yJx7meati8uvWWLVtdUEaZb5zKjDTsqzjSDVu6CFh28FV
	g0fYNQwI00Cv2cwU/28BX56YzY0=
X-Google-Smtp-Source: AGHT+IGZPfpiYXsbzC6Kd2j944oYIWAnaNt1iadFrq65m69Z8lFDVpKqt9t7bI00AQ1BGTLgHae93A==
X-Received: by 2002:a05:620a:1988:b0:7c5:3da2:fc75 with SMTP id af79cd13be357-7cd010f78ebmr2192865885a.24.1747135777198;
        Tue, 13 May 2025 04:29:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00ff11d6sm695864185a.115.2025.05.13.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:29:36 -0700 (PDT)
Date: Tue, 13 May 2025 19:29:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: warning when fetching the sophgo tree
Message-ID: <5muhaygt7rpuyvtx4ppmuuebsqqh7z4bp43c7akmuimxhrnqva@hobausqvilur>
References: <20250513212242.2f951e70@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513212242.2f951e70@canb.auug.org.au>

On Tue, May 13, 2025 at 09:22:42PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Fetching the sophgo tree produced this warning:
> 
> Commit
> 
>   e07daed2a157 ("riscv: dts: sophgo: Move all soc specific device into soc dtsi file")
> 
> added this unexpected file:
> 
>   arch/riscv/boot/dts/sophgo/cv18xx.dtsi.orig
> 

Sorry for the mistake, I add this file by mistake when doing merge.
I have updated the repo and remove this file. Can you re-fetch it?

Regards,
Inochi



