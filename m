Return-Path: <linux-next+bounces-6371-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98311A99AD7
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 23:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7E9A3BAAC3
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 21:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54941F8721;
	Wed, 23 Apr 2025 21:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FIePY4H3"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B3C1EDA04
	for <linux-next@vger.kernel.org>; Wed, 23 Apr 2025 21:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444239; cv=none; b=BywiA90X+BtcWBCzRKvLnFhOZigQVy7lsXIs6u6cSv3fTfe1YINrlpNGkefbtaMb4inttKiISwbAQ15LfilC9YdQdHX/8v5EYDAP3HS8cacyQ5rsW37nMGpewBYpHGfr4uWK3uM/EqdJUatzXL88Tucm41Au0xM6VPcVDMoTbCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444239; c=relaxed/simple;
	bh=YRcSwbBolFQc8nSwL5sHrbHpYScE/u7Jhma2RqHz+j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUtk1NBWvVlHuul0+CT/B1s7+mGfIO2BOflWIpLrQXRA/UrOVm3u3DjKQSkx1uCqSa61dZGN+0nbQZts70zMkvdrZwk48HhgL/RntyIvXjLmJ1Hy6ZbYVzVLqCzcMIidum8g4B6rfgGSZsOnFu98yVbFC3jCvOINzuYfPUi3GgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FIePY4H3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745444235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6zpdAzGqU8En65zRDm3svQdlzjoBQCqoHavCUGrR84=;
	b=FIePY4H3fOSFHI8P7kqRZKXWpsKmixZceZz2CgNi5T7xXXs8veYBMS+SxMpi2hE7lgYHzz
	4GPSWXb+ZHhhv7GGqi70sU7X6joHBTwevra018o/XG8boOvuFC2jeaf+pUSJQCZCXAqOaf
	/YQKxY0kQcfB07dNeq/xFYiuZ0XwSaM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-I8s2vcm3MZGNNGnlvLvogg-1; Wed, 23 Apr 2025 17:37:13 -0400
X-MC-Unique: I8s2vcm3MZGNNGnlvLvogg-1
X-Mimecast-MFC-AGG-ID: I8s2vcm3MZGNNGnlvLvogg_1745444233
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22c35bafdbdso3910065ad.1
        for <linux-next@vger.kernel.org>; Wed, 23 Apr 2025 14:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745444232; x=1746049032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6zpdAzGqU8En65zRDm3svQdlzjoBQCqoHavCUGrR84=;
        b=Sg0UbtQcAR+MN++Xm27omnGjk90Eof7tUOQeiRWe29JbVKuAicYL1baOZi41p15/dd
         7wGYpzUw8JgVRTm3B2NVhBJIgFfpO0xGrBh6kXZ/JK6tWEntxqbfaM5/rwqR+usedEPk
         R/zDaCVNHV8aZyveNCKr5TrYp98WQHzUhBYjWeIwyMwMwooCgAE2TL7xX4cxHIYxycUQ
         T1g2FOw21HZRKTy5iNMJKH5YuHllI5d9hg9FVYtwD3dZS7pBG7QMJMujARJzXmntEQxs
         Gjojk4BzH/uFbH6L57k4/V0Mk5buJB4cjBA7ATA9UT18TtQ+dgqRacD9cKfVL4IaUMjN
         L64A==
X-Forwarded-Encrypted: i=1; AJvYcCVxWGQUMyVr6If4dTuuy8M8mbscyCSFBoL3Dn+nzQnNxUJanVrqwxwVbrhOFXQx7B/8RYY+fE3PFEJy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+25wRTTN7/4xFk5xFsx8RMMFD4V2/qlIkl6YMqFuqGr6C8HUf
	LFIzhD88sILPMRx3yHTqGqpde4urYWrnpMrOFYojVDa+8IFSm1C7U7w8hkXXDJVj10l1gJ4AG4g
	6858VLuSegLlxOdKNQ+eSBPxKzdxsYje7ppfl5SSeJxnwav+1tOMF2bcL8iv4OFNptIY2PTFRRf
	CCXC8cek0J7u7RXVutbwcggbmjJ9GDnv0mqfSwNb59XA==
X-Gm-Gg: ASbGnctNY/nL6Cpd4t/P4XsqThBCTSWSzhCmX75EitohzJoqKFiD197tlDR2uoLv1Bx
	GoTCENvXO83KVVIN44hC2p1/D+TwyWGTm02uF9lvleawTScj/9AloD5cPdGFfKqL8e3E=
X-Received: by 2002:a17:903:1a05:b0:227:ac2a:2472 with SMTP id d9443c01a7336-22db3c1ca14mr1355525ad.28.1745444232106;
        Wed, 23 Apr 2025 14:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6sgY6I2pxXuZTSudbtJ4lUZ6TLEnhs0F3igYXH6AZ+EY6Zv83sSbUFt5Qk99Fog6na5uT4lIOLxW4lG7nCS0=
X-Received: by 2002:a17:903:1a05:b0:227:ac2a:2472 with SMTP id
 d9443c01a7336-22db3c1ca14mr1355385ad.28.1745444231858; Wed, 23 Apr 2025
 14:37:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422092250.71bd2347@canb.auug.org.au> <20250424071419.29a1b93e@canb.auug.org.au>
In-Reply-To: <20250424071419.29a1b93e@canb.auug.org.au>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 23 Apr 2025 23:37:00 +0200
X-Gm-Features: ATxdqUHnxJLIdPIRzb9QzmANW3tx9w6vylH638YfSUGCvlQgJ0mMbewFLAbbspg
Message-ID: <CAHc6FU4FDOTHVWZw_+CwwpKQ62K-fhaV-mStdDW73MnGq0TqLQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the gfs2 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Whitehouse <swhiteho@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 11:14=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> Hi all,
>
> On Tue, 22 Apr 2025 09:22:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > In commit
> >
> >   ae1d809fd0f0 ("gfs2: deallocate inode in gfs2_create_inode")
>
> The above is now commit 2ba70fb39555.
>
> > Fixes tag
> >
> >   Fixes: f1046a472b70 ("gfs2: gl_object races fix")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe you meant
> >
> > Fixes: 9ffa18884cce ("gfs2: gl_object races fix")

Indeed, thanks for pointing this out. Should be fixed now.

Andreas


