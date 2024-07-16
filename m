Return-Path: <linux-next+bounces-3035-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED421932493
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 13:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 258251C20963
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 11:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812121474D7;
	Tue, 16 Jul 2024 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XCuFotjG"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BF03DBB7
	for <linux-next@vger.kernel.org>; Tue, 16 Jul 2024 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721127924; cv=none; b=X5udi5ry+kVW1zPAqZf1z+XGIEfia6Jap9EVvwaeaIPO0UkWXCouy/fS+GeTl/JWyPXTBeXxy4t1jU1y+ANnIJCvWcFgGgYMMPilR4miR+rA7IjA0m+K9M+X1hyqinQczAfSVcYkme8nRJfjEHKgk20NGcdvNUamD6IRO4kDJTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721127924; c=relaxed/simple;
	bh=MvIKsgrPQglT3a9IU8dOgBq33mZYbzlTkWmeXb+3Too=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZfGrSaFU+5E1j/whVjGXwKH6fwJItmOAwtDP5Q9asSND82bt5OyUuZczJ18SkfKIjMkWLpxz9ezFg8ZPxBzgLHzAMQ7CIKpD98R9qVP6iO2oygVf39UsGyK8OgejOjXCC3J+mtchqiW15xLZpi8A6Dl+pqim41ydrL67Boi3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XCuFotjG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721127921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pYv78XViBnNALVFj6b/jz4i+MNwS3QQZFpa8XTMdeZ0=;
	b=XCuFotjG1fMQOrhahLdOjAtHKznb2IvLV4+40hBCim84YoZIliHNJ/23+JKNapMpOvuLsD
	RRqRCPNyaFAdFlzlkPDbw4jLF/UhSOmvXTuYhpPZBzkr1smWot+197rrwl4lUsKJNhaZ6U
	jWtmYW1WU2WVAgVjcvKaic+np2oRU/Y=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-DD_cG1E1MgS5SZ5SY4RiFg-1; Tue, 16 Jul 2024 07:05:20 -0400
X-MC-Unique: DD_cG1E1MgS5SZ5SY4RiFg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ee847979c4so52640711fa.3
        for <linux-next@vger.kernel.org>; Tue, 16 Jul 2024 04:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721127918; x=1721732718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYv78XViBnNALVFj6b/jz4i+MNwS3QQZFpa8XTMdeZ0=;
        b=DFmvwpK2X7t3LwLe4GpS2uJAVjC0/DgCZYdaUUs7SUNJqOdf0EJSGV94grb/LO3a7k
         dckkafJuqf9W98IvuizIGhnVpGAm2xbSwEtVIONwrc66Mx/zZoYQvqkvm8l0RClNnbdk
         hcBA/v8vrd8EgoXT1e81X2aIaHZtr9iv2kXEOxAYW0IkTna4oLx/xxJpxkA33ru611YR
         TRyfB2+ZWz7gUg3DgxA/iQDPSYOkCGoiix/LfswBea6WLhgRx5UCDykqw/lMkkCTWcaO
         NtHVbHrYuqg8eSXDw/8Gq0Q/nJfXDYwvajF/OHkRVLfI0ihsSdYeSWSzZnOdhibROq/c
         dJkg==
X-Forwarded-Encrypted: i=1; AJvYcCXi8cGFKlX4fBZErwzi9vgvbJf/G7ZpJp077sfn6VfyHAObPK4az5WEXsZMLOxh03XiTM0oL1Jni7HUD0GIYfzHanMz8zCHGfSilA==
X-Gm-Message-State: AOJu0YzjG9dvod+m7Dh5OoeKtnBOG+xboG3hOVtCBDitC+Vdr7aXPzEL
	dvGbDMiS1QUv4hguIz3dN46XN5GKclsjrYWDJOcfpf34nyur0+aGq9MF3ncf09BNZb5Fl7T8VWl
	xh3+5PVErsfCcCoQAae2bDFX/o70J5P2qVkU37r5qN+z/T5sacRqP36m6Z4w=
X-Received: by 2002:a05:651c:4ca:b0:2ee:6277:a888 with SMTP id 38308e7fff4ca-2eef41d8eb8mr15529151fa.38.1721127918663;
        Tue, 16 Jul 2024 04:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuz0u0LK36T2lX3jv3BCMXbENBiqBlty86viaW1774/T9hdKdb6NXwWQ8/ImGkAipFLtUvoA==
X-Received: by 2002:a05:651c:4ca:b0:2ee:6277:a888 with SMTP id 38308e7fff4ca-2eef41d8eb8mr15528891fa.38.1721127917938;
        Tue, 16 Jul 2024 04:05:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b26f61fcasm4714101a12.86.2024.07.16.04.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 04:05:17 -0700 (PDT)
Date: Tue, 16 Jul 2024 07:05:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Pirko <jiri@resnulli.us>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vhost tree
Message-ID: <20240716070452-mutt-send-email-mst@kernel.org>
References: <20240715171041.5d0ec5a1@canb.auug.org.au>
 <ZpTXa-E1SpFJfVBw@nanopsycho.orion>
 <20240715045026-mutt-send-email-mst@kernel.org>
 <ZpYURX4IrW05U_O5@nanopsycho.orion>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpYURX4IrW05U_O5@nanopsycho.orion>

On Tue, Jul 16, 2024 at 08:33:41AM +0200, Jiri Pirko wrote:
> Mon, Jul 15, 2024 at 10:50:43AM CEST, mst@redhat.com wrote:
> >On Mon, Jul 15, 2024 at 10:01:47AM +0200, Jiri Pirko wrote:
> >> Mon, Jul 15, 2024 at 09:10:41AM CEST, sfr@canb.auug.org.au wrote:
> >> >Hi all,
> >> >
> >> >After merging the vhost tree, today's linux-next build (htmldocs)
> >> >produced this warning:
> >> >
> >> >include/linux/virtio_config.h:136: warning: Excess struct member 'create_avq' description in 'virtio_config_ops'
> >> >include/linux/virtio_config.h:136: warning: Excess struct member 'destroy_avq' description in 'virtio_config_ops'
> >> >
> >> >Introduced by commit
> >> >
> >> >  e6bb1118f6da ("virtio: create admin queues alongside other virtqueues")
> >> 
> >> Ah, leftover, will send fix. Thx!
> >
> >Better squash it.
> 
> Does it mean you take care of that in your tree?
> 
> >
> >> >
> >> >-- 
> >> >Cheers,
> >> >Stephen Rothwell
> >> 
> >

It's easier for me if you just post a new version of the patchset.

-- 
MST


