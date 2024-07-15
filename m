Return-Path: <linux-next+bounces-3015-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8585931098
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 10:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 626DBB224D0
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 08:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E691850B3;
	Mon, 15 Jul 2024 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YU8tp0rF"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B519813B5B2
	for <linux-next@vger.kernel.org>; Mon, 15 Jul 2024 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721033459; cv=none; b=trh3KQVTxKg67T4YqFqNY17NFtTHgNmv+cMKA91nCUCXvpjWBTVjCurxhIcvTZy/1xh5chE4qwDfu4xzasPfZq8YxGPuix4kgNSL7mlEbH/72zm02+YENqfAXPzApyeL5pJc9YPr21C/fEJlX6ohyGVstIvRCCkPKB9VDfpm+og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721033459; c=relaxed/simple;
	bh=nBbKavCJyqzrIZv8PJAfPA+w4NgQkEV4ydBoPdiObzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIuRjeUevOapuE+bOsy+ftu2AbEvV3dJZSElSeBGuax/mhnXu3Sknab3xK03tPWh1epnRlzS3bidH4CzVc2CvQX9tj1LvDykchBYKN5XjcKecLomjCu8xR3qlKMmwIUoKJXevD3tqLCm+/QUKTkNXExQ8XjPSCm7rZhDJXWRci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YU8tp0rF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721033456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KWvDskXIkPSppbNzkw8xy2ijuffbGpWgqggAAU9Z+vw=;
	b=YU8tp0rFLmFgyolGalTA1ryYHfWVHDhi45Q+KRnN5OkLAmqS+P8wvEojPZV8sRDwr83dyI
	9xxpJTupL6+kzsjuyU+jmcj7P5qF7gwpXFhICw6hdFxryHaq9rgynFzY1785jGfOTj0iNl
	6KpDYwKdCOogE4sZgEbMlmP7lkDYNoM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-n8PqWbMsMlq6ZGkMhw0J8Q-1; Mon, 15 Jul 2024 04:50:54 -0400
X-MC-Unique: n8PqWbMsMlq6ZGkMhw0J8Q-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3679aa0ee0aso2604453f8f.2
        for <linux-next@vger.kernel.org>; Mon, 15 Jul 2024 01:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033453; x=1721638253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWvDskXIkPSppbNzkw8xy2ijuffbGpWgqggAAU9Z+vw=;
        b=E4jt1kkvrluxNyxnzVnG3zDNZQyW/9JQIOB+aGEp6H9QSdtXwvXUSpbfcYhOm0uNPu
         d4Z2O+XA7uLWhrr+dGpUa6b7Uzvz+t7XkIbjcj0o3VLqZrxjjZAr9g86tTfJYlucVpVM
         2FtvCo1h4PzbtaDbPTIuVYCUlNn6E92FWTYdKeFm79rcbmTXeC47QxPDlpASvf/kTWFj
         GKmvEYmWywLRIfkBh7qqW1KDqJ8l2ciDrds8GjuObZMGpvv4WYID/6ykVwpF3YoqieTL
         A9x+S4Rrt2Ze6GUuDeTlwB9WWiSCeCM+bAg5mynqApnMsR+JyIeNJg+wHcLIOPk4aeQz
         G5Hg==
X-Forwarded-Encrypted: i=1; AJvYcCU9rQt9PIqE77Ha/jIdu7/a14pgnwVi/rEuQkd/Y17qu/HJ3GWP5Y9LwzTjq2nDR4F6c3vSuzfTgEA9hU5upTQIClNCk9v4ZjKGng==
X-Gm-Message-State: AOJu0YyUN4zJdMjgPaIdn0bz7kfZBmGjdy5GSXKU3GmAQ9nyHmGv6hbY
	U4Ifd+pvAGwcC78e+M3d1ZrNjISE6iVBiA1CYViYl6rJrTE3hx2EzsRsecRMZSiAPTNKEiP6+SM
	uBMEneQQdBiwALPDiPFEM6YHN4JfUabnpjNS0nKY4jgFtf6bcYidhJ33q9zXjvGcFk70=
X-Received: by 2002:a05:6000:402c:b0:368:75:26d1 with SMTP id ffacd0b85a97d-3680075279fmr7387111f8f.4.1721033453592;
        Mon, 15 Jul 2024 01:50:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJu/xoy+GxopR7vQNdNzzt0DKpGm7Wl2vVr2AxEIguJDoit8gJZFlMar45kfsCRcJX/U9SQg==
X-Received: by 2002:a05:6000:402c:b0:368:75:26d1 with SMTP id ffacd0b85a97d-3680075279fmr7387088f8f.4.1721033452953;
        Mon, 15 Jul 2024 01:50:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5146:27c:20a3:47d4:904])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccc9csm5673375f8f.57.2024.07.15.01.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 01:50:52 -0700 (PDT)
Date: Mon, 15 Jul 2024 04:50:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Pirko <jiri@resnulli.us>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vhost tree
Message-ID: <20240715045026-mutt-send-email-mst@kernel.org>
References: <20240715171041.5d0ec5a1@canb.auug.org.au>
 <ZpTXa-E1SpFJfVBw@nanopsycho.orion>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpTXa-E1SpFJfVBw@nanopsycho.orion>

On Mon, Jul 15, 2024 at 10:01:47AM +0200, Jiri Pirko wrote:
> Mon, Jul 15, 2024 at 09:10:41AM CEST, sfr@canb.auug.org.au wrote:
> >Hi all,
> >
> >After merging the vhost tree, today's linux-next build (htmldocs)
> >produced this warning:
> >
> >include/linux/virtio_config.h:136: warning: Excess struct member 'create_avq' description in 'virtio_config_ops'
> >include/linux/virtio_config.h:136: warning: Excess struct member 'destroy_avq' description in 'virtio_config_ops'
> >
> >Introduced by commit
> >
> >  e6bb1118f6da ("virtio: create admin queues alongside other virtqueues")
> 
> Ah, leftover, will send fix. Thx!

Better squash it.

> >
> >-- 
> >Cheers,
> >Stephen Rothwell
> 


