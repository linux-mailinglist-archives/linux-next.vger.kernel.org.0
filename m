Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7432314208
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 22:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbhBHVkH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 16:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236332AbhBHVjw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 16:39:52 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FACC06178A;
        Mon,  8 Feb 2021 13:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=1egEIN9KAVLmkDNA/9Y5jCb9sIIE0jslDFi4d7XGroY=; b=BRBS1iWvf/PH+Yla7MgefPnIBn
        /x0opwjRjhs6rquANk+314TDwCuFMPYP8wbg3ql97k7cTo/AyTWJNdaTDY+Z1MDh+sqMvh5LfWUje
        pjwz0pi0Vl6cENuCoAeQ68qp+W920cqJizFpRmWkQUY5ZG64lDo0nuZn1/2YTZI635wCM8HT6luVe
        fOjdfQ6zwxm89uT0IviNXHqRxS6uOzjDkWSRyXq96sM/pkCGMVPzeVSHUopUvxZRy7IqLvaXXUTB6
        JAjUOT8813O4G6rDaj9RSbB0Y8oe9JBO+8P1qJit1zKnnxUHQm6H/QzZlEMHJkWMVNCMSI8LWkKPz
        7rNrBH5w==;
Received: from [2601:1c0:6280:3f0::cf3b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l9EFO-0002ab-TY; Mon, 08 Feb 2021 21:39:09 +0000
Subject: Re: linux-next: Tree for Feb 8 (objtool: warnings: 5)
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20210208235246.01cb4daf@canb.auug.org.au>
 <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
 <20210208212153.vs2v7k2c55a3syvo@treble>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9fd03d53-8001-b76f-feea-179c13633a8b@infradead.org>
Date:   Mon, 8 Feb 2021 13:39:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208212153.vs2v7k2c55a3syvo@treble>
Content-Type: multipart/mixed;
 boundary="------------CEF5BBE61C7ED1D59BC64DDA"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is a multi-part message in MIME format.
--------------CEF5BBE61C7ED1D59BC64DDA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 2/8/21 1:21 PM, Josh Poimboeuf wrote:
> On Mon, Feb 08, 2021 at 11:30:59AM -0800, Randy Dunlap wrote:
>> On 2/8/21 4:52 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20210205:
>>>
>>
>> on x86_64:
>>
>> objtool warnings: (from 3 different randconfig builds)
>>
>> drivers/input/touchscreen/elants_i2c.o: warning: objtool: elants_i2c_initialize() falls through to next function elants_i2c_resume()
> 
> Randy, can you share the .o?  (you may need to gzip it, still waiting on
> corporate IT to allow me to receive .o files)

Sure, no problem. It's attached.

>> fs/select.o: warning: objtool: do_sys_poll()+0x8e9: call to __ubsan_handle_sub_overflow() with UACCESS enabled
>> lib/iov_iter.o: warning: objtool: iovec_from_user.part.12()+0x2db: call to __ubsan_handle_add_overflow() with UACCESS enabled
> 
> Peter, we need the patch to prevent UBSAN with gcc7?
> 
>> vmlinux.o: warning: objtool: do_machine_check()+0x7ee: call to queue_task_work() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: lock_is_held_type()+0x107: call to warn_bogus_irq_restore() leaves .noinstr.text section
> 
> Peter?


thanks.
-- 
~Randy


--------------CEF5BBE61C7ED1D59BC64DDA
Content-Type: application/gzip;
 name="elants_i2c.o.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="elants_i2c.o.gz"

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
+AAA
--------------CEF5BBE61C7ED1D59BC64DDA--
