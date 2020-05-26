Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 908F01E2291
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 15:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389318AbgEZNAE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 09:00:04 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:55256 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389313AbgEZNAA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 09:00:00 -0400
Received: from fsav404.sakura.ne.jp (fsav404.sakura.ne.jp [133.242.250.103])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04QCxiSa031908;
        Tue, 26 May 2020 21:59:44 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav404.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp);
 Tue, 26 May 2020 21:59:44 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04QCxhjN031905
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 26 May 2020 21:59:43 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: linux-next build error (8)
To:     Qian Cai <cai@lca.pw>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs <linux-xfs@vger.kernel.org>,
        syzbot <syzbot+792dec47d693ccdc05a0@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <880bb80d-ffb4-f64d-f9dc-aeeb4d3c3cd3@i-love.sakura.ne.jp>
 <94634EA6-1812-4E4C-B156-29482346D3C9@lca.pw>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <8aa523bb-469d-608d-5017-dc0daf847c85@i-love.sakura.ne.jp>
Date:   Tue, 26 May 2020 21:59:45 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <94634EA6-1812-4E4C-B156-29482346D3C9@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020/05/26 21:50, Qian Cai wrote:
> 
> 
>> On May 26, 2020, at 8:45 AM, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp> wrote:
>>
>> The last occurrence was next-20200521. Do you know the commit which fixed
>> this problem (so that we can confirm the problem was already fixed) ?
> 
> Not on top of my head, but I did confirm the issue was fixed since next-20200525.
> 

Then, we can ignore this problem. Thank you.
