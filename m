Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 855B6F8700
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 03:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfKLCsX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 21:48:23 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:40322 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726923AbfKLCsX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Nov 2019 21:48:23 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id DFD8F2CD03B5C34E1874;
        Tue, 12 Nov 2019 10:48:21 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 12 Nov
 2019 10:48:19 +0800
Subject: Re: Coverity: add_ipu_page(): Memory - illegal accesses
To:     coverity-bot <keescook@chromium.org>
CC:     Jaegeuk Kim <jaegeuk@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        <linux-next@vger.kernel.org>
References: <201911111734.21CB897FD@keescook>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <b5adecc4-68ed-09f4-8ed5-90a57f689259@huawei.com>
Date:   Tue, 12 Nov 2019 10:48:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <201911111734.21CB897FD@keescook>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2019/11/12 9:34, coverity-bot wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191108 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> 0b20fcec8651 ("f2fs: cache global IPU bio")
> 
> Coverity reported the following:
> 
> *** CID 1487851:  Memory - illegal accesses  (USE_AFTER_FREE)
> /fs/f2fs/data.c: 604 in add_ipu_page()
> 598     			break;
> 599     		}
> 600     		up_write(&io->bio_list_lock);
> 601     	}
> 602
> 603     	if (ret) {
> vvv     CID 1487851:  Memory - illegal accesses  (USE_AFTER_FREE)
> vvv     Calling "bio_put" dereferences freed pointer "*bio".
> 604     		bio_put(*bio);
> 605     		*bio = NULL;
> 606     	}
> 607
> 608     	return ret;
> 609     }

Thanks for the report.

I double check these related codes:

static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
							struct page *page)
{
	enum temp_type temp;
	bool found = false;
	int ret = -EAGAIN;

	for (temp = HOT; temp < NR_TEMP_TYPE && !found; temp++) {
		struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
		struct list_head *head = &io->bio_list;
		struct bio_entry *be;

		down_write(&io->bio_list_lock);
		list_for_each_entry(be, head, list) {
			if (be->bio != *bio)
				continue;

			found = true;

			if (bio_add_page(*bio, page, PAGE_SIZE, 0) == PAGE_SIZE) {
				ret = 0;
				break;
			}

			/* bio is full */
			del_bio_entry(be);
			__submit_bio(sbi, *bio, DATA);
			break;
		}
		up_write(&io->bio_list_lock);
	}

	if (ret) {

If we get here, that means 1) found nothing due to someone has submitted bio for
us, or 2) found target bio, however bio is full, we submitted the bio. For both
conditions, previously, we grab one extra ref on bio, here, we just release the
ref and reset *bio to NULL, then caller can allocate new bio.

Let me know if I'm missing something.

		bio_put(*bio);
		*bio = NULL;
	}

	return ret;
}

> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487851 ("Memory - illegal accesses")
> Fixes: 0b20fcec8651 ("f2fs: cache global IPU bio")
> 
> 
> Thanks for your attention!
> 
