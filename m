Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97695851B7
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 19:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388843AbfHGRIV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 13:08:21 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35546 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729804AbfHGRIV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 13:08:21 -0400
Received: by mail-pl1-f196.google.com with SMTP id w24so41733322plp.2;
        Wed, 07 Aug 2019 10:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Oc5/+mkxa26+9Mm7KHiWI56JJSv5It7fgiiyYBpofBE=;
        b=YaHCm8UO9hxYC89hrThbjczYtfwY07KQGzJy5cyahCI+V386fuh4f3ZaO+Cs2BS0wd
         tY7CvZD1RMLOcQ/DoYjuav+SBvqyWI7Wdx5cntbEBro+4tOnG+1mRvwAePimBcLtgHWh
         nD06K/Iwv1Sd0tSXe7BdqruLHAkZQvUaytVhq8a5TiiFM/P7ep9JZ26/EyNc1z/EqEHd
         21vxRwDxwgIgTgADf4yqDtVZ0lF4qFg5x1LiG6MbepEb6ByV7Kz4TfTkz9ievZUCMo7h
         S2XJAt/rEwrzvWGnPykYS2tDWEWUAD8F0gt/txGd75laDC+oSNjt++tv9EqxXkZU4tI0
         o5nw==
X-Gm-Message-State: APjAAAXEgJCr2Gohn6UxlnMWyOKMaPkwF5pGWqszM4f7h1IAEkeoyj+O
        uVHCijRElTON3g6+SW1fxTg=
X-Google-Smtp-Source: APXvYqyzqO1rvd6suKL+nQlLdxlj/fSykX9DcXRkJ3/EiPidZK2fMrUq8c3d//Dhcn+x9u9VhZFf1w==
X-Received: by 2002:a63:6d8d:: with SMTP id i135mr8536780pgc.303.1565197700171;
        Wed, 07 Aug 2019 10:08:20 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
        by smtp.gmail.com with ESMTPSA id f20sm106206005pgg.56.2019.08.07.10.08.18
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 10:08:19 -0700 (PDT)
Subject: Re: [PATCH 0/2] scsi: core: regression fixes for request batching
To:     Steffen Maier <maier@linux.ibm.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Ming Lei <ming.lei@redhat.com>
Cc:     linux-next@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-block@vger.kernel.org, dm-devel@redhat.com,
        linux-s390@vger.kernel.org, Benjamin Block <bblock@linux.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Hannes Reinecke <hare@suse.com>, Jens Axboe <axboe@kernel.dk>,
        "Ewan D . Milne" <emilne@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Mike Snitzer <snitzer@redhat.com>
References: <20190807144948.28265-1-maier@linux.ibm.com>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <33a8afce-91a4-2a9d-d822-b12376fd0aa3@acm.org>
Date:   Wed, 7 Aug 2019 10:08:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807144948.28265-1-maier@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/7/19 7:49 AM, Steffen Maier wrote:
> Hi James, Martin, Paolo, Ming,
> 
> multipathing with linux-next is broken since 20190723 in our CI.
> The patches fix a memleak and a severe dh/multipath functional regression.
> It would be nice if we could get them to 5.4/scsi-queue and also next.
 >
> I would have preferred if such a new feature had used its own
> new copy scsi_mq_ops_batching instead of changing the use case and
> semantics of the existing scsi_mq_ops, because this would likely
> cause less regressions for all the other users not using the new feature.

For both patches:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

BTW, these two patches fix several nvmeof-mp blktests regressions.

Bart.
