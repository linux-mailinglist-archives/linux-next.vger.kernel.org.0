Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA1FD2FB0
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2019 19:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfJJRgk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 13:36:40 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41280 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfJJRgk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Oct 2019 13:36:40 -0400
Received: by mail-pf1-f196.google.com with SMTP id q7so4335845pfh.8;
        Thu, 10 Oct 2019 10:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AztIdm8ETHfYaIQY0y0NENQuQnv+NGef0JvaVEKw0VA=;
        b=mtNy5ebUSRFEnD3V21ypvKXYnZn+CTCxyJzt71m+go1RBYZoGknXg+o5YnxWmmF2I/
         4xG5AiPecTw/z8chA1p14YhFBlcOVi8lrnq60M0AuWuxjUSy+e7a0XgryYphA3RlVzkn
         F+mtdpOy1nv0znVisiGkopPWs9U2/jSggnqjXBCX+9ePbLratJh6WmtNwyh6ls4tjnQG
         V9r/7ui/I5b9ZwdImaB5FJFNTg+cL6iwwgzifOmqcKDQ4NmKFA6IuShXcuRxMQdUI4BZ
         AFg12cBG8shgEHZ6KXpbUEfXfPcP7YQhvTZiSOOhZTcedRs5k7i4UJeK284nj9n9WnUA
         5W1A==
X-Gm-Message-State: APjAAAXGz/pPJBofEekiCLapOys3tsopQGJbGTxFnlWxlUFXh12YLytW
        ZAogoeAQzongKVG+1LYPlO01R1Qr
X-Google-Smtp-Source: APXvYqymdms+PgPjcLo7aDcPpc9E7No7XXX10oBOOSZW/Qht9KDC9Y7xMYsUR2hFJDIk7/Q7ryQGkQ==
X-Received: by 2002:a17:90a:9a92:: with SMTP id e18mr12907030pjp.87.1570728998580;
        Thu, 10 Oct 2019 10:36:38 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
        by smtp.gmail.com with ESMTPSA id z23sm5584589pgu.16.2019.10.10.10.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 10:36:37 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191008071620.5799d02a@canb.auug.org.au>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <9d421f2b-04f5-44dc-8a00-981b2ff09b5d@acm.org>
Date:   Thu, 10 Oct 2019 10:36:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008071620.5799d02a@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/7/19 1:16 PM, Stephen Rothwell wrote:
> In commit
> 
>    1d200e9d6f63 ("block: Fix writeback throttling W=1 compiler warnings")
> 
> Fixes tag
> 
>    Fixes: e34cbd307477 ("blk-wbt: add general throttling mechanism"; v4.10).
> 
> has these problem(s):
> 
>    - Subject has leading but no trailing quotes
>    - Subject does not match target commit subject
>      Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Hi Stephen,

The above fixes tag follows the recommended format except that it is 
followed by a kernel version number. Is there a recommended format for 
embedding the kernel version number in a Fixes: tag? I think that 
information is useful. I haven't found any recommendations for how to do 
that in Documentation/process/submitting-patches.rst.

Thanks,

Bart.


