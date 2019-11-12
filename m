Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21185F9D72
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 23:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfKLWrd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 17:47:33 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33057 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLWrd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 17:47:33 -0500
Received: by mail-pf1-f195.google.com with SMTP id c184so153094pfb.0
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 14:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XbboyRXrqS/uInMNO6cSc2agSiz0sb0z9DZcUkZuyAE=;
        b=SCDGYQRZXwNS3OASAJ7w4pUyR2kfiMbVVwixM6Zcf9MYFQP6N7+5g7yu+sO6foCFA3
         zWg2SVadHopqymiQ8bAXecLDSSkxkbNFCIFZxBH7zSE2SsThWf0LzEcpIfKtqyaJIVAN
         KMjjOkwBZ5Ja4LvHQJb5L/13zUut/jwsdvpOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XbboyRXrqS/uInMNO6cSc2agSiz0sb0z9DZcUkZuyAE=;
        b=t3eRLUZatwDuG/eU4ThoyO09Oq0AY4KgrZNXEDaQbJmt3n7po71Avg3fvFHbF2q16m
         w1KVgzRSqDqKgFJ44Yf2a5e9pWuSB0cdLoV0N927rzBv8/Yl16wh3WGyFxFi6aIvQphY
         elyPGC+eVQaZ3ZKhCaczXihlEBQxNDbpmpP/PrgMug7IQ+LHystaPfGhGrr9YtrZZLwN
         Bnj0iYO024eE9vZiWyzznu3Sm828QIhbc4NV3vpO/cCbz/Or+/EwE8QC9nPwtjQrGIKM
         IfDAj4Iq3/wlWqNi56V2x67LOdBJYh+YjwJaq30OBHSuJVZGCd1zR5gynXcjLeoI7Vsv
         Vb4Q==
X-Gm-Message-State: APjAAAWmXoX22ayM0qXkjo42R3A/OhV2Jw2DTdLp7BLnujU76BxTxDYR
        TeCb9D5bbkKvYFisnPR9d30Wkg==
X-Google-Smtp-Source: APXvYqwNxJznJNh7uj2FB/hP35ygN2mW9Q4bXQkVyBxijQhixSxjuoUyDlUHwAhkrZqUGD+VeOhN9w==
X-Received: by 2002:a63:7448:: with SMTP id e8mr39236175pgn.268.1573598850938;
        Tue, 12 Nov 2019 14:47:30 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u3sm155644pjn.0.2019.11.12.14.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 14:47:30 -0800 (PST)
Date:   Tue, 12 Nov 2019 14:47:29 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Chao Yu <yuchao0@huawei.com>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: add_ipu_page(): Memory - illegal accesses
Message-ID: <201911121446.8469990D9@keescook>
References: <201911111734.21CB897FD@keescook>
 <b5adecc4-68ed-09f4-8ed5-90a57f689259@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5adecc4-68ed-09f4-8ed5-90a57f689259@huawei.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 12, 2019 at 10:48:19AM +0800, Chao Yu wrote:
> On 2019/11/12 9:34, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > 0b20fcec8651 ("f2fs: cache global IPU bio")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487851:  Memory - illegal accesses  (USE_AFTER_FREE)
> > /fs/f2fs/data.c: 604 in add_ipu_page()
> > 598     			break;
> > 599     		}
> > 600     		up_write(&io->bio_list_lock);
> > 601     	}
> > 602
> > 603     	if (ret) {
> > vvv     CID 1487851:  Memory - illegal accesses  (USE_AFTER_FREE)
> > vvv     Calling "bio_put" dereferences freed pointer "*bio".
> > 604     		bio_put(*bio);
> > 605     		*bio = NULL;
> > 606     	}
> > 607
> > 608     	return ret;
> > 609     }
> 
> Thanks for the report.
> 
> I double check these related codes:
> 
> static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
> 							struct page *page)
> {
> 	enum temp_type temp;
> 	bool found = false;
> 	int ret = -EAGAIN;
> 
> 	for (temp = HOT; temp < NR_TEMP_TYPE && !found; temp++) {
> 		struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
> 		struct list_head *head = &io->bio_list;
> 		struct bio_entry *be;
> 
> 		down_write(&io->bio_list_lock);
> 		list_for_each_entry(be, head, list) {
> 			if (be->bio != *bio)
> 				continue;
> 
> 			found = true;
> 
> 			if (bio_add_page(*bio, page, PAGE_SIZE, 0) == PAGE_SIZE) {
> 				ret = 0;
> 				break;
> 			}
> 
> 			/* bio is full */
> 			del_bio_entry(be);
> 			__submit_bio(sbi, *bio, DATA);
> 			break;
> 		}
> 		up_write(&io->bio_list_lock);
> 	}
> 
> 	if (ret) {
> 
> If we get here, that means 1) found nothing due to someone has submitted bio for
> us, or 2) found target bio, however bio is full, we submitted the bio. For both
> conditions, previously, we grab one extra ref on bio, here, we just release the
> ref and reset *bio to NULL, then caller can allocate new bio.
> 
> Let me know if I'm missing something.

Okay, I've noted it as a false positive. I don't know this code at all,
so I can't really comment on the lifetime expectations here. :)

Thanks for looking at it!

-Kees

> 
> 		bio_put(*bio);
> 		*bio = NULL;
> 	}
> 
> 	return ret;
> }
> 
> > 
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include these lines (but double-check the "Fixes" first):
> > 
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1487851 ("Memory - illegal accesses")
> > Fixes: 0b20fcec8651 ("f2fs: cache global IPU bio")
> > 
> > 
> > Thanks for your attention!
> > 

-- 
Kees Cook
