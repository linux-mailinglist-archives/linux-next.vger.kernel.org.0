Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 433BB7120EF
	for <lists+linux-next@lfdr.de>; Fri, 26 May 2023 09:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjEZH2Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 May 2023 03:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236862AbjEZH2P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 May 2023 03:28:15 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3859AE41;
        Fri, 26 May 2023 00:28:01 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-55db055b412so21384077b3.0;
        Fri, 26 May 2023 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685086080; x=1687678080;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2plEDbI3vkoMsRT5+764kLb9XDgxtH9eFEV6HjsgfWw=;
        b=o51PS8nnGEEJG5PLVAfYXTb00/179VJM7iBDqOIHdSlXt0TDQCtRN9+wCGjTaufU2+
         pZfA1QfEv1QdYm8tTZ8qk8KyA7H/of/brRToTess6UfBDEuclOQ4f92qCB+/aPKiNuTS
         pfnD0eFtfucfxVGvf1FYdBtVpET/D7URlw5iPgPqPBr357gkrosUHuNu5rBUdD0yXvW/
         TyBe5L8PuFybrumrwiM56JhcfK/zVqmF520HNVIlc1SVDmYEYjdZOFJ6EFBYl/VxeWOB
         z6dq8zN69ckc5KjFtcpi85g4pys1JdzZ7Fhsz6K5Ca1gwIdU2JRtnmusR7fBHL0hwMXo
         c9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685086080; x=1687678080;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2plEDbI3vkoMsRT5+764kLb9XDgxtH9eFEV6HjsgfWw=;
        b=JNnFcYvmB+/iMlr3CfGCiTFAPsHEQLchjcMmSVwZallsf26Wm2vI3aGPJE8Sga6B6j
         F/PmM5EtArYzaGxsktohm4YENO2XoZ/NyCAsGOiUumZFUdo92//LJooCy7GWnT8rhGqv
         fTH2OLiyAVh1oO8BPJoqQz5pU8aMXfFXyPgnJ2ySL9A0FP3Uk+nZwsj2E3jpwm3paulI
         97cSAa1uDyp7yKSlivve3mVi22NruuDkXeUxZsl7iPrfkf1wkepXsP4SAm9lFtq7zciW
         Qby6E/rgNmx+IEKb+idmFeCmv6H/pV4MUPj3yMXFU8rclskVImoyPSwbrBkK1lLx2rIj
         mpxw==
X-Gm-Message-State: AC+VfDzQ90pjpF5AOUzDVrrEQwTUxMc0CgYQKh4LuAnADSTbPk6k5/ZR
        FPC89FG6qQlhnpTooDUVlYreAOb+LKMBCfkzsniEf/QDU0K3lw==
X-Google-Smtp-Source: ACHHUZ4n/oNX51z9bZ/362uqmSNt11smJr5LsdBAPXc9+Y+JkilYaWcZI+BOZNiN8IfuwR6GR0R++WsVTqB13SMB8jI=
X-Received: by 2002:a81:a14a:0:b0:564:c747:64f4 with SMTP id
 y71-20020a81a14a000000b00564c74764f4mr824579ywg.11.1685086080110; Fri, 26 May
 2023 00:28:00 -0700 (PDT)
MIME-Version: 1.0
From:   Murphy Zhou <jencce.kernel@gmail.com>
Date:   Fri, 26 May 2023 15:27:48 +0800
Message-ID: <CADJHv_sedgbfxvZkKHjC6quKvxR+E54noFCVF93MvhyK6bwRoA@mail.gmail.com>
Subject: ioprio_set can take 8 as the PROCESS CLASS_BE ioprio value
To:     Damien Le Moal <dlemoal@kernel.org>, linux-block@vger.kernel.org,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Damien,

Since these commits:

  scsi: block: Introduce ioprio hints
  scsi: block: ioprio: Clean up interface definition

go into linux-next tree, ioprio_set can take the value of 8
as the PROCESS CLASS_BE ioprio parameter, returning
success but actually it is setting to 0 due to the mask roundup.

The LTP test case ioprio_set03[1] covers this boundary value
testing, which starts to fail since then.

This does not look as expected. Could you help to take a look?

Thanks,
Murphy

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/ioprio/ioprio_set03.c
