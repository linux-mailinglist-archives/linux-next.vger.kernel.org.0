Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8C718651A
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 07:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729633AbgCPGih (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 02:38:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51369 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729435AbgCPGih (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2020 02:38:37 -0400
Received: by mail-wm1-f65.google.com with SMTP id a132so16297756wme.1;
        Sun, 15 Mar 2020 23:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=L/hVm9PFFup3qS7IkAWx1YNVvGEF1kg6IBxXb7BSSz4=;
        b=oV5obvJhF2zMHd+Irf8W7beSFHNQS3maE+DsmjzgTJs2mHRFBFyHd1yk+Sxy7D1Q+6
         Myt3Yjx8/H6vKJoIn/KFmSTQpy61x7eiYN/fTf4q6ra4y32X473TTno8q2s5jCwqKioz
         URWwp//aiBG2LLITeZK8kjFTrgEWk/i/mjYqo5PYQQZ+Ks/wGb+jLatkSAUgiCD9Z+Fa
         HTx6Jt0mXa4MKA7VkRxyPR4nRV/AHg4euVGTcW5Hy36B+q/p+Bw0PI7y0Cxby2HKPPy5
         Tv/UakuW9NxYu/qPMXO7M+K6QAt4w3R3Uijv1eJ9orcMHysmSf1a+50co0tzB+sO1hx5
         kZ5Q==
X-Gm-Message-State: ANhLgQ1t00nuoyP1qqCCJERxUiwDuk82p8WduEe+SUX95Kq8fsGm3O7S
        g9ZV4D+HYIwooN9925c9rcdhFBB9
X-Google-Smtp-Source: ADFU+vslDcUQeSCwZ7u/5/zXeSvaSUK8YUvibE0DUSA2CdPPk5TwiMHhfiR9C8IryrwYPhZLRD+XRw==
X-Received: by 2002:a1c:9658:: with SMTP id y85mr16958701wmd.63.1584340714724;
        Sun, 15 Mar 2020 23:38:34 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id i12sm330803wro.46.2020.03.15.23.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 23:38:34 -0700 (PDT)
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
To:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200310144013.6df85b46@canb.auug.org.au>
 <20200310090422.GB2445065@kroah.com>
From:   Jiri Slaby <jslaby@suse.cz>
Autocrypt: addr=jslaby@suse.cz; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b518b4d6-b959-525f-1425-cdcb1277958f@suse.cz>
Date:   Mon, 16 Mar 2020 07:38:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310090422.GB2445065@kroah.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10. 03. 20, 10:04, Greg KH wrote:
> On Tue, Mar 10, 2020 at 02:40:13PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the tty tree got a conflict in:
>>
>>   drivers/tty/vt/selection.c
>>
>> between commits:
>>
>>   4b70dd57a15d ("vt: selection, push console lock down")
>>   e8c75a30a23c ("vt: selection, push sel_lock up")
>>
>> from Linus' tree and commits:
>>
>>   9256d09f1da1 ("vt: selection, create struct from console selection globals")
>>   bc80932cc25a ("vt: selection, indent switch-case properly")
>>
>> from the tty tree.
>>
>> I fixed it up (I think - see below) and can carry the fix as necessary.
>> This is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> Thank you for this, I hadn't gotten to it yet.
> 
> Your merge looks the same as mine, and I've pushed out the merge
> resolution in my tree.

Ah, the two merges differ, actually.

Stepen's (cdc26c076ff):

-       if (sel_cons != vc_cons[fg_console].d) {
 -      mutex_lock(&vc_sel.lock);
+       if (vc_sel.cons != vc_cons[fg_console].d) {


Yours (cb05c6c82fb0):
 -      if (sel_cons != vc_cons[fg_console].d) {
 +      mutex_lock(&vc_sel.lock);
 +      if (vc_sel.cons != vc_cons[fg_console].d) {

> Jiri, can you double-check to verify that the merge is correct in my
> tree?

So this is now a tty tree problem. Will send a patch in a minute.

thanks,
-- 
js
suse labs
