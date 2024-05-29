Return-Path: <linux-next+bounces-2421-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB2F8D37FB
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 15:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD57C1C23B15
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 13:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E5917BBA;
	Wed, 29 May 2024 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IrnBRPJr"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F43617BA0
	for <linux-next@vger.kernel.org>; Wed, 29 May 2024 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716990031; cv=none; b=C8RKWhsmLzRgBzTeKhrOIPWxwTjOUY1cDyK/mltTLIMhrZ1xoTGUgI2+IiptldFgqqyWOHa/h994IQaOKupMThCs/oAi94cuJdcZnXS/DaBAEnHDcn9IekFs1R6lo9IFm0anf8eO81Zwy9q4zCWy06At32h5ldntH6dN8Pet65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716990031; c=relaxed/simple;
	bh=5Ez9jZH2PKtFGaFDWpF1OwKNiwRKcCs7djlHUD3uXEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Orw0Jg6ieqYA9PKSFECm/jK4BUVIKaN3fV8eXwUyiDKYj85Y0dOCoWaeh1eZn6OHNpmBtJEaBaGOY7R5YsPQJxSVWwxok2qL0C1RJ9+0Rf1Y0rgBluetOyIYHRAD+YgVT1tuZoFWGayQzREge5Z3pvVv+Dvq0aV755rn1L3Oq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IrnBRPJr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716990028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Ez9jZH2PKtFGaFDWpF1OwKNiwRKcCs7djlHUD3uXEk=;
	b=IrnBRPJrOM0XttJLrSlD16OTf8WXZWlguuaty5ST01oWTWZXdnAXah7SB6gcpeeOh9kswG
	L+UzlbFtggKgdvKRJP5d3xl1xCKvEUDyRZi0sH1MswViGdHpBPH+1RI0hxiCa1qpXUNrEA
	m3vQyY3yIytMMxmr1qLkMyO0n/OgTCk=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-H7s15bivOj6Nhlj5Qhze0w-1; Wed, 29 May 2024 09:40:27 -0400
X-MC-Unique: H7s15bivOj6Nhlj5Qhze0w-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1f4947bbb52so14582125ad.1
        for <linux-next@vger.kernel.org>; Wed, 29 May 2024 06:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716990026; x=1717594826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ez9jZH2PKtFGaFDWpF1OwKNiwRKcCs7djlHUD3uXEk=;
        b=du4p2GkV7mIr1tThQ/ewbSrrpoVSS7yOtJMD0RtrZ6enMiMoYL959U1zfaD/4ASV5f
         dlpGBiMRPQXc+AMLH628s7dS3/nNNepFoNxhDW7PRJotV+guVJBmjZjzDTSYVgVxAljN
         5aA4j4UNqrXIyR5YIOYvXgR+yZ1TxA+QoF2qm6B03RgVlFOed0VREePEy9pilelV/6gf
         GzepA4zOODSRZ6kz7NpkwgUhE/QS66rFTqQwb6M5UgGFG4osV8e8vlO70TvHffOkkKV4
         +cwXi3qGWKXxSaapfUwsTLU2AcjMB29zi41quP5nVYLfB9SYSu51dTjxoli2cvgp7OzJ
         ilwA==
X-Forwarded-Encrypted: i=1; AJvYcCXkKnlgX7UubKzxUPLFkbGYlzEpLIChuzGOLgNj/KjL7exskzTh4ZRyJe5pJcE+fT2Q+T4N2tf0wwx9lkPW5yGsENfmrFn/XQGuaQ==
X-Gm-Message-State: AOJu0Yx8Jf7o67NWxi34vc7Avm8rEDJoejaE5LEDUL0fHr08/O4hp8yv
	7zEFqnaCD2bIh5UqxO1Aa4QYofSA9Mo23lowc0ltxGAk+mmseHwwQXJeP3tnidbZTzlVtmgTagl
	MJ+x/Lm/patL/pFUJ3DAmjaCpH1bKvX6HFa9tNBSoeX0S8CbITrRrVqB3IcLwoLiFXGgAjS6no6
	le1PQVHyTP8hk3DDVjmJqafP6M/axdOGivMI9cYnyIuYB5
X-Received: by 2002:a17:903:2348:b0:1f5:e635:21ec with SMTP id d9443c01a7336-1f5e6352748mr9142185ad.2.1716990025520;
        Wed, 29 May 2024 06:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0S5gXrV/GBghoh/ixew2azTNCZXBrjfD35PnRbeWfkCRz+K91GQKZf43KZEZzD7tyiTl1iRGus5zWGxQSZ2k=
X-Received: by 2002:a17:903:2348:b0:1f5:e635:21ec with SMTP id
 d9443c01a7336-1f5e6352748mr9142035ad.2.1716990025144; Wed, 29 May 2024
 06:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529142455.1c68e65a@canb.auug.org.au>
In-Reply-To: <20240529142455.1c68e65a@canb.auug.org.au>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 29 May 2024 15:40:13 +0200
Message-ID: <CAHc6FU7MrnksU9vDvdAvc_tv5knukGpnxXEpqidvdfWqDf1p5Q@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the gfs2 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Whitehouse <swhiteho@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 6:34=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> Hi all,
>
> After merging the gfs2 tree, today's linux-next build (htmldocs) produced
> these warnings:
>
> Documentation/filesystems/gfs2-glocks.rst:64: ERROR: Malformed table.

Fixed, thanks.

Could you please remove Bob Peterson <rpeterso@redhat.com> from the
recipients of these notifications as that address no longer exists?

Thanks,
Andreas


