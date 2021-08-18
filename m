Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBE13EF85D
	for <lists+linux-next@lfdr.de>; Wed, 18 Aug 2021 05:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235554AbhHRDHp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 23:07:45 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:44791 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbhHRDHo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 23:07:44 -0400
Received: by mail-pf1-f175.google.com with SMTP id k19so716562pfc.11;
        Tue, 17 Aug 2021 20:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nsTSyR9juQiQWSPeB70442fXZVLJAuiODqtYkB2eTKA=;
        b=QfOmTIwBLsOzgHhaty9AjFsUEhsjiM/28bZOJkLYWnIzEt/DHucUUP5ek0mUnP2ftS
         KmNVmAqmUCLhQHQANjU84c1aqIZe/dJsQDWrHs83ZnQR+m5hkCPUcEta1UbCI+UjD+IK
         j0HKnPXWfwYaF/+n4gDd3r6nJkG1bvTMgyEFJnOSWAIlekBD67vifJID48tudlNteevm
         6l0isO8O7i+fX+uYbWhw4v8Rzr5iupubjDaovD4g6uWzB84qSztd/cMk4seM6tPl7ZHj
         F4F/lUrI3UQLqoXzM5pmB2B3NziLXzulOJxCm6IU3ndQsXoqHVeNFjcy2eAS/yM1hcXd
         5oMA==
X-Gm-Message-State: AOAM5316kn5pWXMJs2yqt9uymkA5iw58f2Pqdrg4CG0+wLSxqhwLcx20
        VEkQ5LzhHp6knTFRLh/RUZP5SF9Z2KE=
X-Google-Smtp-Source: ABdhPJxsYiy2gFssugohJAyH4OQTsP+X103w0bL1Kz/q30MxFTb0VTKhDyu9YHzx2IFs2lfXZ5OHow==
X-Received: by 2002:a05:6a00:24c2:b0:3e2:878d:7e44 with SMTP id d2-20020a056a0024c200b003e2878d7e44mr6086139pfv.22.1629256029468;
        Tue, 17 Aug 2021 20:07:09 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:a2e:bdc6:d31c:3f87? ([2601:647:4000:d7:a2e:bdc6:d31c:3f87])
        by smtp.gmail.com with ESMTPSA id b7sm3702229pfl.195.2021.08.17.20.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 20:07:08 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
To:     John Garry <john.garry@huawei.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
References: <20210817194710.1cb707ba@canb.auug.org.au>
 <c27c2909-1701-b972-dd7c-98bdc53ab8f9@huawei.com>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <41d95ecd-5657-8f32-cf1a-a6d249f91cd6@acm.org>
Date:   Tue, 17 Aug 2021 20:07:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c27c2909-1701-b972-dd7c-98bdc53ab8f9@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/17/21 2:51 AM, John Garry wrote:
> sorry... I only built x86 and arm64 allmodconfig. Let me check this.

Build testing for tree-wide changes is tricky. You may want to use a
build bot for such testing. From
https://01.org/lkp/documentation/0-day-test-service:

Q: Which git tree and which mailing list will be tested? How can I
opt-in or opt-out from it?

A: 0-Day monitors hundreds of git trees and tens of mailing lists. You
can obtain detailed tree and mailing list information from the source
code under the lkp-tests/repo directory. If you want to add or remove
your tree from the 0-Day test system, send an email to the LKML,
specifying your git tree URL.

Bart.
