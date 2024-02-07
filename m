Return-Path: <linux-next+bounces-1043-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D7084C34F
	for <lists+linux-next@lfdr.de>; Wed,  7 Feb 2024 04:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C146B21B98
	for <lists+linux-next@lfdr.de>; Wed,  7 Feb 2024 03:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3D01095C;
	Wed,  7 Feb 2024 03:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EB0oPSS0"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C3A10949
	for <linux-next@vger.kernel.org>; Wed,  7 Feb 2024 03:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707278073; cv=none; b=LMTpw3WY7Hzp62QhDGxiQoS1xFjTxCDo7klkMqkD6zGDAxukGpzLxCegHArkmW7KMecGT/4/Hf1VKRgQVuR3MbAT+MjIh7sL8fouc/cz3XX+3Ut13ahcjZG9kPC941mGWZITGoxIhJgVm/4td8K9/a/j6GkwyuEbzpKg+OfMZL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707278073; c=relaxed/simple;
	bh=HeHSpaBPWNe8yR0xTabGzqMF1m+sLioUPLP6/R7rgcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Av1JfLLsTJ5nNeasXDeAG/aPs2xNidFutu2eq5DceK/u86ugH0vB8Me+0+hkXKudz7t2hGAW24hHVRa1bAd1ZOUronTSlUTG4IT43HtlFtPgKWFJIaULKTnuPqmbt7prZuM3quzrGwFlBsRfPtCka6MDD1t64AaLgU84pMrKp/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EB0oPSS0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707278071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3gLX6Sq94fbV1ugzJ1BRE1vmNqjyOlnYCDmqCtVNNA=;
	b=EB0oPSS0mAUAcfR4oYpjVHHGrOvtEAbXVPLCPwmnwHyQ2lwsFRnhjXRZ5EaUNPnunhW7np
	kZRleYUTwfiYU83CjYDc9Xn/zgSJjaJZ+6nTWgu1fZFvUbePxaivscZgeOM5cb9RXAYgp/
	Ml5gnJwbwlYV3lR0Mst+WzNxxDlunds=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-F3v92ygaPKqPD6mPHSDwgw-1; Tue, 06 Feb 2024 22:54:29 -0500
X-MC-Unique: F3v92ygaPKqPD6mPHSDwgw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7853c364e60so18327785a.2
        for <linux-next@vger.kernel.org>; Tue, 06 Feb 2024 19:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707278069; x=1707882869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3gLX6Sq94fbV1ugzJ1BRE1vmNqjyOlnYCDmqCtVNNA=;
        b=iQQ/eV7hYQq7QQLlQUiW9EB7lIJea6Cvv1F/40ANBUbvNqqfDp0dR/WEUNXZWvLm92
         2BERKO+ail86NOIL5krUYkD+UkZCswzMnKOYFvGuNSdZ3yZ3RrF3Dq3Exd5oLvAp2pG1
         DBKzqTpHsnYYsbrJ60MQKZbpj/f6KqVb840enRZSNvyIvDbw/kYKhkMGma7gm/GsFVdt
         iv8AF0o6WyNzh+LBYFtUlo9BJ5bx7hyu5J3pTkjDOfaqc9WBR/NvzRnliSK/tgJWLTVF
         yZgiqd8VWuIUQbSykJiW3ePsPcOTJebZ88Bd7gEFFTdN4Whe71y195S0AsfqPxzIDJwZ
         YoiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWDAZMP8kDTC9lcRqF38S6HiOGp23pXyhPBiza4h6LgtkjARQ7F8Pj6YFLPECawghlXNkXawIp01E1YO4hzRxTpOPE1Q42zoI8Bg==
X-Gm-Message-State: AOJu0Yw8hOHVqWVLcPLBTQnK4E3IugVUAyo3YEaKA6jE6DGP/xEKsFTF
	y5uXRB0HSc6V2OJuOvop8vo1PonccMaZDKLn0M2E7kgjERy1+PKDULLvIY+4xt7/GdEeosraxmE
	T/FfZ+M7wCF34XVwAOrmlS9/gzoMqqd3L/n/DLBxyYHH9lACV0u6vFWqeKDM=
X-Received: by 2002:a05:620a:2a0b:b0:785:9698:f5a3 with SMTP id o11-20020a05620a2a0b00b007859698f5a3mr2123652qkp.76.1707278069377;
        Tue, 06 Feb 2024 19:54:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWg956Vk1ongLTPMuU4aVgl1ljYtphImbazJCZsVO5D1+1uyie+YIy9ImtSpfJG1/Yss1BWg==
X-Received: by 2002:a05:620a:2a0b:b0:785:9698:f5a3 with SMTP id o11-20020a05620a2a0b00b007859698f5a3mr2123643qkp.76.1707278069164;
        Tue, 06 Feb 2024 19:54:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvlpCNIsZUaElGHEq/fgh7QjQ9sevS4GsxMVvZ82Gcb+1WocQiFTswVmx95rNAyUrtSHsMzR9H01upFD/q6pCEjHTmaw5pRNf2QhudR5D8P1kEqUM8zo+REVzy3ygANoKFUid4SP9l8YiOJMYIkWkKhf+wSkGrn93fOtsDyLdZMR9nkgJlRG3Qlm9lsasCI8oXOKYNuk/OwW8Srt+TNGoyuCHZI0S0F+ZHEI21j3JqqWO8epRKma+5tXWYS9Tty2LsUn7Ymw3WeqvaZeyDP2AiPQT36xUE+XpXoDaI8Wp2v95MV68UEY3ZJGQD3vovAepJ60OfiXg=
Received: from [192.168.1.158] ([70.22.187.239])
        by smtp.gmail.com with ESMTPSA id z35-20020a05620a262300b00783148d1269sm158484qko.62.2024.02.06.19.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 19:54:28 -0800 (PST)
Message-ID: <ed502d03-adf0-6eec-5392-02569ae48889@redhat.com>
Date: Tue, 6 Feb 2024 22:54:27 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: Hongyu Jin <hongyu.jin@unisoc.com>,
 "J. corwin Coburn" <corwin@hurlbutnet.net>, John Wiele <jwiele@redhat.com>,
 Michael Sclafani <vdo-devel@redhat.com>,
 Thomas Jaskiewicz <tom@jaskiewicz.us>, Yibin Ding <yibin.ding@unisoc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240207144053.1285b3e2@canb.auug.org.au>
From: Matthew Sakai <msakai@redhat.com>
In-Reply-To: <20240207144053.1285b3e2@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acknowledged. We will get this sorted out as soon as possible.

Matt

On 2/6/24 22:40, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/md/dm-vdo/io-factory.c: In function 'read_ahead':
> drivers/md/dm-vdo/io-factory.c:118:17: error: too few arguments to function 'dm_bufio_prefetch'
>    118 |                 dm_bufio_prefetch(reader->client, block_number, read_ahead);
>        |                 ^~~~~~~~~~~~~~~~~
> In file included from drivers/md/dm-vdo/io-factory.h:9,
>                   from drivers/md/dm-vdo/io-factory.c:6:
> include/linux/dm-bufio.h:86:6: note: declared here
>     86 | void dm_bufio_prefetch(struct dm_bufio_client *c,
>        |      ^~~~~~~~~~~~~~~~~
> drivers/md/dm-vdo/io-factory.c: In function 'position_reader':
> drivers/md/dm-vdo/io-factory.c:182:24: error: too few arguments to function 'dm_bufio_read'
>    182 |                 data = dm_bufio_read(reader->client, block_number, &buffer);
>        |                        ^~~~~~~~~~~~~
> include/linux/dm-bufio.h:64:7: note: declared here
>     64 | void *dm_bufio_read(struct dm_bufio_client *c, sector_t block,
>        |       ^~~~~~~~~~~~~
> 
> Caused by commit
> 
>    82da73bac1ee ("dm vdo: add deduplication index storage interface")
> 
> interacting with commit
> 
>    3be93545346e ("dm bufio: Support IO priority")
> 
> I have used the device-mapper tree from next-20240206 for today.
> 


