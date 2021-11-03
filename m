Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 587EF443C0F
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 04:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhKCD52 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 23:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbhKCD52 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 23:57:28 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B200C061714
        for <linux-next@vger.kernel.org>; Tue,  2 Nov 2021 20:54:52 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id b203so1258841iof.1
        for <linux-next@vger.kernel.org>; Tue, 02 Nov 2021 20:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=i27R3A+rrJ80+5uqYKMsuni1Egr2obkOOJTcRaU9VrU=;
        b=fMZ9AvPKu+E+nY7TZSGkZp9SKEUvhfZfnEMZDeICL4RG1iOeUNnQl7NaNLX56dH5Di
         XK+kPd1xiCsjeXgL4mRQwayyTufGz6D2iNVA7Db7QpegWuIIiYaml5Gri1Hc/UvB1Wt+
         rZ4mun9kZjdeLArJdv7uIcPNSh1aw5FNADkNysDqcJCyEVDUYy5VUMOyLLd469tqZg2Q
         xKq9bIOgLxfmGYztIcYfPZOhJyiO5qtRRKAw8hkov8921RWfOf58/B3CSCNA0DuWMyfa
         iTtOy/dFrR/gbknBZuosn1dP32Kg8xfzKJtHkvzZxghX64CmjIwmYqPjilUJtBzLA10+
         TGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=i27R3A+rrJ80+5uqYKMsuni1Egr2obkOOJTcRaU9VrU=;
        b=D2kyg4zX5v7ERnvQX2JiYPLFE9gIRsehLJ0gOxZzAGQDCq6zXbqRPX+nOyD+4fV2C0
         /7/UhvvVBMVyO0w61HrDcqLEd5kfAWlhpa5Ed6JdEdu9P+x1sokioKdfytABRLbF8Kaj
         V/3lMYEt+iM8Te71vyjg1FybO2XS5/fhwWCyIdiUfabDeu6E2ywyxAj+TVxWNxC2VQV1
         xZMSc4evGIchSpeyqw3+wYl/aEI3GNvr9nxdDNmRe0FTaikN2UkL+2iB/Xam/VGiLLkW
         cgPdqvYLIxZuaRuhbBlgu5YfI01WF34t4Hry9ynZK6qtcEHNEvWmNyrYet5UJFh7iJFr
         dBhg==
X-Gm-Message-State: AOAM533yMCHy4vOvUzG1JpBKZg98jpPvnnBlHSCadzKDAPd7r1pLnRLx
        bPUC3uTD9knV8l1UZOOJAO5ZkA==
X-Google-Smtp-Source: ABdhPJxUVvqpOg1yn0emVtYjt+WnFpo+38+XtO1u0fIJjw3dDf86rfGc2M+MOrdMT4Bhbb6C56iKjg==
X-Received: by 2002:a05:6638:d90:: with SMTP id l16mr31063339jaj.36.1635911691950;
        Tue, 02 Nov 2021 20:54:51 -0700 (PDT)
Received: from smtpclient.apple ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id u12sm562792ilm.1.2021.11.02.20.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 20:54:51 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Jens Axboe <axboe@kernel.dk>
Mime-Version: 1.0 (1.0)
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
Date:   Tue, 2 Nov 2021 21:54:50 -0600
Message-Id: <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
References: <YYIHXGSb2O5va0vA@T590>
Cc:     Yi Zhang <yi.zhang@redhat.com>,
        Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
In-Reply-To: <YYIHXGSb2O5va0vA@T590>
To:     Ming Lei <ming.lei@redhat.com>
X-Mailer: iPhone Mail (19A404)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Nov 2, 2021, at 9:52 PM, Ming Lei <ming.lei@redhat.com> wrote:
>=20
> =EF=BB=BFOn Tue, Nov 02, 2021 at 09:21:10PM -0600, Jens Axboe wrote:
>>> On 11/2/21 8:21 PM, Yi Zhang wrote:
>>>>>=20
>>>>> Can either one of you try with this patch? Won't fix anything, but it'=
ll
>>>>> hopefully shine a bit of light on the issue.
>>>>>=20
>>> Hi Jens
>>>=20
>>> Here is the full log:
>>=20
>> Thanks! I think I see what it could be - can you try this one as well,
>> would like to confirm that the condition I think is triggering is what
>> is triggering.
>>=20
>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>> index 07eb1412760b..81dede885231 100644
>> --- a/block/blk-mq.c
>> +++ b/block/blk-mq.c
>> @@ -2515,6 +2515,8 @@ void blk_mq_submit_bio(struct bio *bio)
>>    if (plug && plug->cached_rq) {
>>        rq =3D rq_list_pop(&plug->cached_rq);
>>        INIT_LIST_HEAD(&rq->queuelist);
>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>>    } else {
>>        struct blk_mq_alloc_data data =3D {
>>            .q        =3D q,
>> @@ -2535,6 +2537,8 @@ void blk_mq_submit_bio(struct bio *bio)
>>                bio_wouldblock_error(bio);
>>            goto queue_exit;
>>        }
>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>=20
> Hello Jens,
>=20
> I guess the issue could be the following code run without grabbing
> ->q_usage_counter from blk_mq_alloc_request() and blk_mq_alloc_request_hct=
x().
>=20
> .rq_flags       =3D q->elevator ? RQF_ELV : 0,
>=20
> then elevator is switched to real one from none, and check on q->elevator
> becomes not consistent.

Indeed, that=E2=80=99s where I was going with this. I have a patch, testing i=
t locally but it=E2=80=99s getting late. Will send it out tomorrow. The nice=
 benefit is that it allows dropping the weird ref get on plug flush, and bat=
ches getting the refs as well.=20

