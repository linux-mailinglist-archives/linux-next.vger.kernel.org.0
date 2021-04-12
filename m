Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD1135C66C
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 14:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241048AbhDLMkJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 08:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240875AbhDLMkI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Apr 2021 08:40:08 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FE5C06174A
        for <linux-next@vger.kernel.org>; Mon, 12 Apr 2021 05:39:50 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d8so6283080plh.11
        for <linux-next@vger.kernel.org>; Mon, 12 Apr 2021 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=gr77k9QIz5RgOpRuocDvfRh6v9EnFR0pe6j1Y5IYB2c=;
        b=0lVDWVm2c4P6uDnoiat392Tzm+7LBnyUzpU5Wt2kYXqlKQqRgnzzkcPBZ5bC96fT53
         WaC89SsJzCZZlw3XjnaoKp9POAJNaMWypeUhMOUXE6UwNf5evSUhXjINsGpDJEsjykpG
         tK4/+emmLri02KKDgdDuT/vFBXZWYc/QRWd3pdGijKa7waLuYw8wMsXeioTJJ9vf+gKk
         EU/AOtNsPQVpQ9z+yJFvwQeN7OqAdRPMdVwxGqMSFL0IYWthX8FUVd2Uh+qCj6KDvHDk
         aOFih1e0kXItsRoYXmJ/gIdqXF8JkybU1sEja7r93RvLioldEwYsJPIr+K0xBciiDb4e
         53NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gr77k9QIz5RgOpRuocDvfRh6v9EnFR0pe6j1Y5IYB2c=;
        b=T3WIBK3vFs63C7BMUrl3/61HDN8SB9RckAuGLmkDq8mXQOGWfp4Z72zf1ugrhTud4s
         vPJqhFVT45uKhm+/yKIZSp4gWOeA9BF93AXaaqk2F72oZZgE0u1Uq68uG6LvOeU8C7aH
         +DwXN5yyqU2olyM0UF7V0DlryDI0lllTfIfOVou48B4rjTvo/t/fFikzW9McUHa9KekV
         pgf66mT/bxX0+O1DOCILckSBO1VKPER9GPe2PUyZxPb+4mAuSrhNCWnhSHWhNHXU3jx2
         /2TYsbl/m0YIeTxjUB4IvN4VoQewlKBhPrTeSAQTPEUx9x1apow83+n1FHdgh3/twm1Q
         qgSw==
X-Gm-Message-State: AOAM533x1JDPFNKFMdD98y/Xd17JgU+LGGJQ1NxeQc6gaGQbb65EO5Tf
        J4aiRRDGYDPr6TO599g5zwKB4w==
X-Google-Smtp-Source: ABdhPJx6BDqLnXuiU8ZrCCZF5U8r3KW7U8g+JmBycODpTH8WyxV7HHlVa393OvPHk1gCIGIMZGhBAQ==
X-Received: by 2002:a17:90a:f307:: with SMTP id ca7mr27538838pjb.80.1618231190278;
        Mon, 12 Apr 2021 05:39:50 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id a3sm10238643pjq.36.2021.04.12.05.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 05:39:49 -0700 (PDT)
Subject: Re: mmotm 2021-04-11-20-47 uploaded (fs/io_uring.c)
To:     Randy Dunlap <rdunlap@infradead.org>, akpm@linux-foundation.org,
        broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        mm-commits@vger.kernel.org
References: <20210412034813.EK9k9%akpm@linux-foundation.org>
 <34ed89e1-683e-7c12-ceb0-f5b71148a8a7@infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <9533afdd-208e-c25d-2e11-cc7f2c9d147b@kernel.dk>
Date:   Mon, 12 Apr 2021 06:39:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <34ed89e1-683e-7c12-ceb0-f5b71148a8a7@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/12/21 1:21 AM, Randy Dunlap wrote:
> On 4/11/21 8:48 PM, akpm@linux-foundation.org wrote:
>> The mm-of-the-moment snapshot 2021-04-11-20-47 has been uploaded to
>>
>>    https://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> https://www.ozlabs.org/~akpm/mmotm/
>>
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
>>
>> You will need quilt to apply these patches to the latest Linus release (5.x
>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>> https://ozlabs.org/~akpm/mmotm/series
>>
>> The file broken-out.tar.gz contains two datestamp files: .DATE and
>> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
>> followed by the base kernel version against which this patch series is to
>> be applied.
>>
>> This tree is partially included in linux-next.  To see which patches are
>> included in linux-next, consult the `series' file.  Only the patches
>> within the #NEXT_PATCHES_START/#NEXT_PATCHES_END markers are included in
>> linux-next.
> 
> on i386:
> # CONFIG_BLOCK is not set
> 
> ../fs/io_uring.c: In function ‘kiocb_done’:
> ../fs/io_uring.c:2766:7: error: implicit declaration of function ‘io_resubmit_prep’; did you mean ‘io_put_req’? [-Werror=implicit-function-declaration]
>    if (io_resubmit_prep(req)) {

I'll apply the below to take care of that.


diff --git a/fs/io_uring.c b/fs/io_uring.c
index 3a837d2b8331..aa29918944f6 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2464,6 +2464,10 @@ static bool io_rw_should_reissue(struct io_kiocb *req)
 	return true;
 }
 #else
+static bool io_resubmit_prep(struct io_kiocb *req)
+{
+	return false;
+}
 static bool io_rw_should_reissue(struct io_kiocb *req)
 {
 	return false;
@@ -2504,14 +2508,8 @@ static void io_complete_rw_iopoll(struct kiocb *kiocb, long res, long res2)
 	if (kiocb->ki_flags & IOCB_WRITE)
 		kiocb_end_write(req);
 	if (unlikely(res != req->result)) {
-		bool fail = true;
-
-#ifdef CONFIG_BLOCK
-		if (res == -EAGAIN && io_rw_should_reissue(req) &&
-		    io_resubmit_prep(req))
-			fail = false;
-#endif
-		if (fail) {
+		if (!(res == -EAGAIN && io_rw_should_reissue(req) &&
+		    io_resubmit_prep(req))) {
 			req_set_fail_links(req);
 			req->flags |= REQ_F_DONT_REISSUE;
 		}

-- 
Jens Axboe

