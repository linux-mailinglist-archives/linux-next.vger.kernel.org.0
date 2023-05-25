Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2048A710C49
	for <lists+linux-next@lfdr.de>; Thu, 25 May 2023 14:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbjEYMpp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 May 2023 08:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239813AbjEYMpb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 May 2023 08:45:31 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649E49B;
        Thu, 25 May 2023 05:45:30 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-b9daef8681fso421114276.1;
        Thu, 25 May 2023 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685018729; x=1687610729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2EgvRCmk8HZRlkVe8tT7FrQyjXG54U7wK2DUs1qcNc=;
        b=b23Z3Orjg0Q3D4S0JZ9BrlYAhLoBpRnvT6ryr0cpcHviF9l3HreHLzfDNqRkM5RAe9
         +ObZge3mEjxjUXGOdGLuHLDhRlN1HntNmWZFEUaUGCG3lY7qsif3d52s0T0DUOB/knk/
         oMQ87f1+uypP5JgksMGV7HbkLankLBrsS3Dk52r9VBwCMwgeeF198gvTIK6GMGuEIOEf
         rIXQkeEbiwuR4/g1ATr22+X2W10YGbV2TMOVLC9XHNT8syg1JhjrFbT3QWfHHzriRMW/
         cxF+dUyuG4rDIS+EQTrFTtT8MqqVKuGhq/DP4QkxWwf7zFMltlpDmEHSpdMIdOJXSGqb
         YNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685018729; x=1687610729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2EgvRCmk8HZRlkVe8tT7FrQyjXG54U7wK2DUs1qcNc=;
        b=IQ8G9FVufwviavsRaFdKqNpKeNT0LsIRiUTmfdNkF4e/N2MKTP0GZe1g93lVT5Tjh0
         hOG4q+7eD/mV02ZmGLCdM4X3p//8gVOx13MsIhLNTHjVG7w82MN5oT7+jn+XqVsqLPWv
         7+ieZ0SfG+/mnh43B2DqrYAIdF1V1RMhNoR5bPpAxEGHT7SKusl05jQH4SuhWvSbLldI
         MgczbFRWomQAwzZvnYQkv5tjZbW5LG90Rckat8kpjMYtn3t9mEt7ad/GxGvxId959oh5
         pFrgnzgnkqJ8EFVRjvDWW2ITfKUOzymBymcKQ2fkYOCLDg3xD/Dr2hl2vfbXMYAlyA8Y
         Uy3Q==
X-Gm-Message-State: AC+VfDxqEbs8RLfff9sf9ZxPZ4W8o5wj7oUcKKO4Ltgocxfi3EaXtwUC
        chxbrNZOmhLGsTgVKuNrr19BdY7/j8XZTcL7321NIqiXYSc=
X-Google-Smtp-Source: ACHHUZ6q+zm+eX5tov55de23ywRnl2eTWPeT6sRnqICONAy/ywfn/3+IVWHMnoT5yYdrmtVEFkmAyyfdZd9LLFjS5T4=
X-Received: by 2002:a0d:cc81:0:b0:561:b783:fb76 with SMTP id
 o123-20020a0dcc81000000b00561b783fb76mr20669529ywd.51.1685018729593; Thu, 25
 May 2023 05:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <CADJHv_ujo+QUE7f420t4XACGw4RvVpckKSJcJ_9_Z0b2gdmr+g@mail.gmail.com>
 <20230525120402.GA6281@lst.de>
In-Reply-To: <20230525120402.GA6281@lst.de>
From:   Murphy Zhou <jencce.kernel@gmail.com>
Date:   Thu, 25 May 2023 20:45:18 +0800
Message-ID: <CADJHv_u7pV_g5DeNBjQKPXv4tfSg6Rc9FXjKD5F+ioHX6jrVdg@mail.gmail.com>
Subject: Re: your mail
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux-Next <linux-next@vger.kernel.org>,
        linux-xfs <linux-xfs@vger.kernel.org>, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 25, 2023 at 8:04=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Thu, May 25, 2023 at 08:01:22PM +0800, Murphy Zhou wrote:
> > Hi Christoph,
> >
> > The linux-next tree, since the next-20230522 tag, LTP/writev07[1]
> > starts to fail on xfs, not on other fs. It was pass on the previous
> > tag next-20230519.
> >
> > After those 2 commits reverted on the top of 0522 tree, it passed.
> >
> >     iomap: update ki_pos in iomap_file_buffered_write
> >     iomap: assign current->backing_dev_info in iomap_file_buffered_writ=
e
> >
> > (the second one was reverted because the first one depends on it)
>
> Yes, they are known broken.  There has been a v2 on the list already,
> which still has issues for fuse, so there will be a v3.

Great! Thank you.
>
