Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE3064640C
	for <lists+linux-next@lfdr.de>; Wed,  7 Dec 2022 23:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiLGW1Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Dec 2022 17:27:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiLGW1X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2022 17:27:23 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE95716FF
        for <linux-next@vger.kernel.org>; Wed,  7 Dec 2022 14:27:22 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id v1so8094326ioe.4
        for <linux-next@vger.kernel.org>; Wed, 07 Dec 2022 14:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E6iNgn6tk9NKSC6em5LUaxYi23kEXMA8wWQ/A+TIsuM=;
        b=JEYuxx4faUl/mXyDiboBJCytx8+6HH34bwhg/QEt15x0+Aqvlc2quizZtvo1O+TG0U
         KeoWvMleX8NKbtVqLjvtjbTFO2JNDVeBek5gNOraQxvIPz3E1uUS6RJ5dX1WvKKIOZ7y
         euM8sS4zGNvWmQqKL9JZuqz4KBNcrBkX3J5FNGpjIgjikkoMWYaesIucw/p1VTA3BS2f
         mQIawjLRxymROxbiDQZ0m1qe8QmmvXbd1NGtzpqlS60eQrDZza9dP624DWJw8R4CHA8F
         jibStbQ1pbkkwY7pjwCvSefP3IqDnqrTrIuHScgNi6QZO7ZJOHu6rWRmqtUFcpP4Kc6c
         lpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6iNgn6tk9NKSC6em5LUaxYi23kEXMA8wWQ/A+TIsuM=;
        b=avxBhhr7S+JBhIiJ/p9nBRnmcpVzUtZ7SnfnBJR+A5t905dBTpJDtHs+xT7/0Usrws
         PfwqGp3SJkfvx6B2ihKvz7ahl+FHTO5dL/9HLm431iIbyPvy1uMQPVhbBoeF/bSmWGDO
         0c2GtgMbfRU/QMN/1tuwgtV/vPjRTnmpmBdGEHLgo8yD0QttHEEgJx/mFsbSQfP6wjom
         tlGvmrQLCn8CyGvfyDEiw/WtkaEt1wW0t3Y3Sd0gM4MW+Ezs6JtSAeXZ9LJSqk5u9KBk
         py1Y+agemf8DljQ0OZld1ocoqEqDT9KRXMGM1iK8zALFTKA78SSbDtRJLF0IMljFjd4r
         HI0w==
X-Gm-Message-State: ANoB5pmXKY05r7JWzkftJd0aO61+hKiBSpmg5sQC5T60qg9NRJy+o+FB
        bPgtb9O8vZw6M7Qr69mZJFCdiS13QP+Waf2i5iIiMQ==
X-Google-Smtp-Source: AA0mqf7UVEuSnzHfpH6eTqiF1bDc1jJ7UGXfh44X72St/ctRV8R8g3GUravzdm1Vk6ByeE8L+nuAJb2bo7Rt6v0a3as=
X-Received: by 2002:a02:b395:0:b0:389:922b:cab4 with SMTP id
 p21-20020a02b395000000b00389922bcab4mr28941784jan.137.1670452041873; Wed, 07
 Dec 2022 14:27:21 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYv_UU+oVUbd8Mzt8FkXscenX2kikRSCZ7DPXif9i5erNg@mail.gmail.com>
 <b7d8193c-7e15-f5cd-08d4-8ef788d9bb36@kernel.dk>
In-Reply-To: <b7d8193c-7e15-f5cd-08d4-8ef788d9bb36@kernel.dk>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Wed, 7 Dec 2022 23:27:11 +0100
Message-ID: <CADYN=9LaiBU-Q5=FSvFKTi_qzE1C45DkdUAfbaZH7FZhn2tbYw@mail.gmail.com>
Subject: Re: next: LTP: syscalls: epoll_clt() if fd is an invalid fd expected
 EBADF: EINVAL (22)
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, regressions@lists.linux.dev,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        LTP List <ltp@lists.linux.it>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, chrubis <chrubis@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 7 Dec 2022 at 17:22, Jens Axboe <axboe@kernel.dk> wrote:
>
> On 12/7/22 8:58?AM, Naresh Kamboju wrote:
> > LTP syscalls epoll_ctl02 is failing on Linux next master.
> > The reported problem is always reproducible and starts from next-20221205.
> >
> > GOOD tag: next-20221202
> > BAD tag: next-20221205
> >
> > tst_test.c:1524: TINFO: Timeout per run is 0h 05m 00s
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if epfd is an invalid fd : EBADF (9)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd does not support epoll : EPERM (1)
> > epoll_ctl02.c:87: TFAIL: epoll_clt(...) if fd is an invalid fd
> > expected EBADF: EINVAL (22)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if op is not supported : EINVAL (22)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is the same as epfd : EINVAL (22)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if events is NULL : EFAULT (14)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is not registered with
> > EPOLL_CTL_DEL : ENOENT (2)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is not registered with
> > EPOLL_CTL_MOD : ENOENT (2)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is already registered
> > with EPOLL_CTL_ADD : EEXIST (17)
>
> This should fix it:
>
>
> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index ec7ffce8265a..de9c551e1993 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -2195,6 +2195,7 @@ int do_epoll_ctl(int epfd, int op, int fd, struct epoll_event *epds,
>         }
>
>         /* Get the "struct file *" for the target file */
> +       error = -EBADF;
>         tf = fdget(fd);
>         if (!tf.file)
>                 goto error_fput;

Yes this patch fixed the issue [1].

Cheers,
Anders
[1] https://lkft.validation.linaro.org/scheduler/job/5931365#L1371
