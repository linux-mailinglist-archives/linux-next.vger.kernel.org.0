Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD292D6193
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 17:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732102AbgLJQUq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 11:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389987AbgLJQF4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 11:05:56 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3C6C0613D6
        for <linux-next@vger.kernel.org>; Thu, 10 Dec 2020 08:05:16 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id a12so6023214wrv.8
        for <linux-next@vger.kernel.org>; Thu, 10 Dec 2020 08:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:references:from:subject:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=NtWC1MFWh2ZmjVPvLTTmoLPrQ21xqYoAnMXG0VhKsVo=;
        b=XhKLYnV2lgdZYg1GJeQ6kGd+pWPLu4ylneIFcwYOSdITyTxJ2bMuDxqTwLwpZCXy1q
         GcAL9dnkmE7DGUc+wZj+E+bMaW+k6IMdVz83OnyGYwloWpJcFARzlT+Fcgg+JR8oqtOl
         NzScYr6pSjgsRD17tyNZuxkT3DllCp/pUSSS6eMzhwAB2PRZitgk8sMsv86+PTa8bs98
         1iVdT4PMNwHzKKtYgnaPM+QXFNU7C6Cz0NHEkKcO0f7kq9Di5xcnJdmdkBmHWYfB9kMs
         pKx96dfs/dEiprJmtNSqy75TZcF7tIA0Y19J4rgkOwOFIflSh/M/SI5jN5dvvpIsMFxZ
         e9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NtWC1MFWh2ZmjVPvLTTmoLPrQ21xqYoAnMXG0VhKsVo=;
        b=J2q2FMXKwSqyPdnU5dDpLxfFHjzEFgU2GZAQG5CX7NOeXyDBO8N+JanXvBoGrHLS9n
         a66oyYqmoH4Bm6449r1qpl3+Oe3ncpfo7zE+EH+PFLNPlV58o/RlvwIh/pa1j1JbBvsu
         xrWkFPjuIRFmc9gGvpB0g/krY5+GYTYztTOFMdG0wBn47tFUu5NBUpXXW8DqcKFTp3Dt
         XV+HgsIUPIDOP3f9agakevfsbCWTxZwEOYNKJrxWipwAVjb4ktYI2WzD9Cbisei8I+re
         c+OI9QqrJQHgBrcOjzrlR5pM46Jqi0brAMbITBfbzIYhvGqPq9cPFzDPd7aAuwfuvh1h
         0f3g==
X-Gm-Message-State: AOAM531WGNcnXihGsvjXYBz3y1CttsWl2l2DAkwgxHc9frmVETeGdPM3
        0200hxxRf3dPrb1T5DLWiHk7sTlBIYZmVA==
X-Google-Smtp-Source: ABdhPJzk1vGDxF1lYn6ajNZxTM5re+zeXSQ6iohTDBRVOXHtteZ9a6KD2SXKRJMRkZr+dyg8fmqMiA==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr9069013wrw.157.1607616314753;
        Thu, 10 Dec 2020 08:05:14 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id c81sm10915190wmd.6.2020.12.10.08.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 08:05:14 -0800 (PST)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Liam Mark <lmark@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201210203845.04557b46@canb.auug.org.au>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <75905385-217a-a8f2-e304-f31e554cbad0@linaro.org>
Date:   Thu, 10 Dec 2020 18:05:12 +0200
MIME-Version: 1.0
In-Reply-To: <20201210203845.04557b46@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks for the report Stephen!

Andrew, I have sent you an updated patch. Please let me know if you prefer
a follow-up fix instead.

BR,
Georgi

On 12/10/20 11:38, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/vm/page_owner.rst:44: WARNING: Literal block ends without a blank line; unexpected unindent.
> Documentation/vm/page_owner.rst:49: WARNING: Literal block ends without a blank line; unexpected unindent.
> 
> Introduced by commit
> 
>    6cf22751938a ("mm/page_owner: Record timestamp and pid")
> 
