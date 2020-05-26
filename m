Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4991E2234
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 14:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388913AbgEZMpO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 08:45:14 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:54213 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388746AbgEZMpO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 08:45:14 -0400
Received: from fsav405.sakura.ne.jp (fsav405.sakura.ne.jp [133.242.250.104])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04QCitkW017257;
        Tue, 26 May 2020 21:44:55 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav405.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav405.sakura.ne.jp);
 Tue, 26 May 2020 21:44:55 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav405.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04QCitNk017253
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 26 May 2020 21:44:55 +0900 (JST)
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
References: <CACT4Y+azkizw6QA0VCr0wv93oSkgaYCPc4txy9M=ivgBot1+zg@mail.gmail.com>
 <37C9957E-40A6-4C29-95FC-D982BABD26F6@lca.pw>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <880bb80d-ffb4-f64d-f9dc-aeeb4d3c3cd3@i-love.sakura.ne.jp>
Date:   Tue, 26 May 2020 21:44:56 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <37C9957E-40A6-4C29-95FC-D982BABD26F6@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020/05/26 21:41, Qian Cai wrote:
> 
> 
>> On May 26, 2020, at 8:28 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
>>
>> Crashes (4):
>> Manager Time Kernel Commit Syzkaller Config Log Report Syz repro C repro
>> ci-upstream-linux-next-kasan-gce-root 2020/05/22 01:23 linux-next
>> e8f32747 5afa2ddd .config log report
>> ci-upstream-linux-next-kasan-gce-root 2020/05/21 15:01 linux-next
>> e8f32747 1f30020f .config log report
>> ci-upstream-linux-next-kasan-gce-root 2020/05/19 18:24 linux-next
>> fb57b1fa 6d882fd2 .config log report
>> ci-upstream-linux-next-kasan-gce-root 2020/03/18 16:19 linux-next
>> 47780d78 0a96a13c .config log report
> 
> You’ll probably need to use an known good kernel version. For example, a stock kernel or any of a mainline -rc / GA kernel to compile next-20200526 and then test from there.
> 

The last occurrence was next-20200521. Do you know the commit which fixed
this problem (so that we can confirm the problem was already fixed) ?
