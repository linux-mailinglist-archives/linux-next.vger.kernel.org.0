Return-Path: <linux-next+bounces-1271-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55F85EC8C
	for <lists+linux-next@lfdr.de>; Thu, 22 Feb 2024 00:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F0C21C21A26
	for <lists+linux-next@lfdr.de>; Wed, 21 Feb 2024 23:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA6F81726;
	Wed, 21 Feb 2024 23:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="SYprxqwU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93BD7FBC2
	for <linux-next@vger.kernel.org>; Wed, 21 Feb 2024 23:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708556924; cv=none; b=L0w8guJaTos2yCgllBO1khzgYehMrwcbZ9aogvsLJB25sn/GolY7K2QnoG1AS/7yTzp6M3RJCmqt8VZ0yPgTGhqinu+EH0n83vL3rvL+TyNZNuYGwDk/hY2vTjWpSJeYsdpqQygi1GJ4LtwwU3dno3xGDNLmVWfZoJnc9j1Z5i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708556924; c=relaxed/simple;
	bh=ubWxMaDgQA7aCLDJJnk56SO9zudn89gqBTa6kQPbUZI=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=fQslLWHoFbXs0VbfdOJoZWwoVvrNS47VWN24+NBRq1uGlUKmjnIINxjboYUa6cYcXIGMZuqb7NTK6jdA8NGlsgl9M3XIbHBZMvghj+7r2DiGSirpxWLCIKzrRAeQ76YiRGzu2PB6q9SVt2fvRaIdSIkhmMZTX98FXc3KQNuSlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=SYprxqwU; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so6057233a12.1
        for <linux-next@vger.kernel.org>; Wed, 21 Feb 2024 15:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708556922; x=1709161722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyIdnrPvkMs2AU+vw/nEPIW+QxndqyTNQEwIk71io1o=;
        b=SYprxqwUT6HKzA3P3l8z0BmVIICC5JFM3ziQFzAfWyvPNbcX5r9SJTu0mac4SJgAbY
         oLCFdmHG+FzC6DGV1L1eLHqcVp4tOgJUcCMhtXSkgn6MfCofyiPGxgM/9AEpaMYP5ix6
         zgna/S/AYzPjoKqMomjnRvlGS9HmrKHK6HKm5zoFFIwmG77Ky3ma6z+RAw80R317Q8sZ
         h6JhvRRnuJqFiJZ3+nFrXISXuq3I+ocz3PAlRpOIQKpYOVr/O9ITyPuQejfMZ8aViE8R
         T9S4KcT33FLqR0O/iAuOznF1/Q8aSrPpe+8KYi03MqYqWJ/pu8H6lJ5Vu8kVYEQ8z3FW
         +mTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708556922; x=1709161722;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyIdnrPvkMs2AU+vw/nEPIW+QxndqyTNQEwIk71io1o=;
        b=S1C7x3AKpvdyLOHmYUgvRp/diY26Nfjx3qD6C/azDmHgGYxl85Dq8tRXb9JrFVXOYT
         Lq3WoAVaqO+JO/xmXkp2n3fDJ3JLBXay8pAuoQL2JhjB7UYSuvD8lL+1hCmJGRRf/JTV
         cv4I/w4DEzxhYgJkFP/xHt8aUh/ZC/jRUPUFo2+csJEXSwjsavdbDR2o3kcSKee8sNmT
         ERJuUIswKBlg1HnOVzKeTrhIh5JMgrUiV9YoX0gaTE1LpQeIaxIlL6HlS1xcLD8IR2I8
         1r6+L8fZ6A1SWPgGDZLC/JbMushfETP9wspT32zI2cHi02e5WpbSVqGY25TwxDMvd9/k
         CXVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwcB2PHZmqmcdQ5L/o0sU+JyP6P1R/U6quPXviyNWr0ddVDPeRLTso2XBGAs0ilIp/4NtcM5avxskaPF8wZU/gfT4LflEj/nrsEQ==
X-Gm-Message-State: AOJu0YwR5um/RdDx5OlfhTs4nSEy0PzhwToFahepVs6s2Q+rSo4wow8h
	zrFDs/FxXoCM9GqnS2xEZ0hMxFEcJCziRm8cj9a2kPxotPkGXOsZlXdbnMEuNFo=
X-Google-Smtp-Source: AGHT+IHThDor4vbSwCGzgqxbkS1L4FAjcJEeNqRKW6q1pX8qIRUqKbsUqTEftPikKBnSg4ZOCItd1Q==
X-Received: by 2002:a17:90a:604e:b0:299:3f2a:4309 with SMTP id h14-20020a17090a604e00b002993f2a4309mr12544246pjm.18.1708556921732;
        Wed, 21 Feb 2024 15:08:41 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id qj15-20020a17090b28cf00b002961a383303sm2420580pjb.14.2024.02.21.15.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 15:08:40 -0800 (PST)
Date: Wed, 21 Feb 2024 15:08:40 -0800 (PST)
X-Google-Original-Date: Wed, 21 Feb 2024 15:08:39 PST (-0800)
Subject:     Re: linux-next: duplicate patch in the risc-v-fixes tree
In-Reply-To: <20240222093025.5f9d9ad5@canb.auug.org.au>
CC: Paul Walmsley <paul.walmsley@sifive.com>, greg@kroah.com,
  linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-57f0dff8-c22c-4e94-be94-376c833e3b1f@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 21 Feb 2024 14:30:25 PST (-0800), Stephen Rothwell wrote:
> Hi all,
>
> The following commit is also in the tty.current tree as a different commit
> (but the same patch):
>
>   481860974faa ("tty: hvc: Don't enable the RISC-V SBI console by default")
>
> This is commit
>
>   8b79d4e99407 ("tty: hvc: Don't enable the RISC-V SBI console by default")
>
> in the tty-current tree.

Ah, sorry about that.  I'd been trying to figure out why my tester was 
broken and forgot to check if someone else had picked this up.  Should 
be gone now.

