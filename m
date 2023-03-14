Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E73C96B8B52
	for <lists+linux-next@lfdr.de>; Tue, 14 Mar 2023 07:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjCNGit (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Mar 2023 02:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjCNGis (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Mar 2023 02:38:48 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8E5206AB
        for <linux-next@vger.kernel.org>; Mon, 13 Mar 2023 23:38:46 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id v27so13141464vsa.7
        for <linux-next@vger.kernel.org>; Mon, 13 Mar 2023 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678775925;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=34toPK5Jl7g5SJWTUbt6qHTuMP2kgJb9d92d5TQ6uKc=;
        b=raCj5tUYX+K7OOxji5NdA+0Ff/Mdh9u8jl7XugmtOTZV1HUU/o7HEb8a7hZUM2WItC
         30vLy46VtTKY/ppD2vx3ZoDy6f8ymm8eZWP7ZIR2zxMKl7yfDw31APFw8Fi9ZoTsLn97
         +DtymiQV4vd6ANcOFbaskjpHQR5DTQWH7O7aWRL0w+8PT0aItswtzJ6ltV/X9rpQIHaf
         QW14yTxF2P9S6M8/t5QadqD8UTRHTZYGispBW5kFTchvawkeED58mIFrPgvGttYqIesz
         0WbuSkRwXYqHCSAhlnpUrrDrN3A/WTm6dIItOf07N5+X7GEtqnpRMipQCrkUsJDIsFSC
         yP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678775925;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34toPK5Jl7g5SJWTUbt6qHTuMP2kgJb9d92d5TQ6uKc=;
        b=cf+kt1FJhokfe9+cet/0hV5jDxPaUOry9BjKrbRJMwmwBaT07BCbslezQKO1Lnm9x9
         nZx2Feic/a1doErmNmqfqKeaXo2IfYFncLSOV9HlMUVeBZp26mf/83MSEso9Pl0uwms6
         oncMLewKnVZ38wFkYhbn5CePmnXbFyyvztYt8huSceTC/f6IT5BLoI7QIJ0g4NvrFufI
         HFi6h9nSjNJHYl64nuDE/At1ZpLo//y35Bveemh6aRBsC/8eUG4kUMmGDjrIBKGqQwPZ
         6AUcAa8ZFGoXfqvC3KeDBfc3uVAR/QKX4AzWrEv9ohVik2BMZLCk2+qDq04fVQMMkW/W
         Q5Cw==
X-Gm-Message-State: AO0yUKVmYlTrx1E0lGPtsPd/i2btREaB9pHNA89GJK6/jiOdSImC1NT0
        tZlU5/3EClZ36CKWfmMcjVwb0ALCavlgDkJsuScvS1LX1u2/mvARaZ8=
X-Google-Smtp-Source: AK7set/kfLikdpcpac3M0evkK49tLDLlO5sj8TiVD2479Mz9ekdBHkmkNuDWazJLrtOSTFRc8xaVUVAeNtyZ3HiXru4=
X-Received: by 2002:a05:6102:23d1:b0:412:5424:e58e with SMTP id
 x17-20020a05610223d100b004125424e58emr8949913vsr.0.1678775925387; Mon, 13 Mar
 2023 23:38:45 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 14 Mar 2023 12:08:34 +0530
Message-ID: <CA+G9fYtBnwxAWXi2+GyNByApxnf_DtP1-6+_zOKAdJKnJBexjg@mail.gmail.com>
Subject: next: zip.c:35:8: error: packed attribute causes inefficient
 alignment for 'magic' [-Werror=attributes]
To:     open list <linux-kernel@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>, lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Andrii Nakryiko <andrii@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
        KP Singh <kpsingh@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

perf builds failing from Linux next-20230307..next-20230314 but pass on
Linux mainline v6.3-rc2.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---
libbpf/staticobjs/zip.o
zip.c:35:8: error: packed attribute causes inefficient alignment for
'magic' [-Werror=attributes]
   35 |  __u32 magic;
      |        ^~~~~
zip.c:40:8: error: packed attribute causes inefficient alignment for
'this_disk' [-Werror=attributes]
   40 |  __u16 this_disk;
      |        ^~~~~~~~~
zip.c:45:8: error: packed attribute causes inefficient alignment for
'cd_disk' [-Werror=attributes]
   45 |  __u16 cd_disk;
      |        ^~~~~~~
zip.c:50:8: error: packed attribute causes inefficient alignment for
'cd_records' [-Werror=attributes]
   50 |  __u16 cd_records;
      |        ^~~~~~~~~~
zip.c:55:8: error: packed attribute causes inefficient alignment for
'cd_records_total' [-Werror=attributes]
   55 |  __u16 cd_records_total;
      |        ^~~~~~~~~~~~~~~~
zip.c:58:8: error: packed attribute causes inefficient alignment for
'cd_size' [-Werror=attributes]
   58 |  __u32 cd_size;
      |        ^~~~~~~
zip.c:63:8: error: packed attribute causes inefficient alignment for
'cd_offset' [-Werror=attributes]
   63 |  __u32 cd_offset;
      |        ^~~~~~~~~
zip.c:66:8: error: packed attribute causes inefficient alignment for
'comment_length' [-Werror=attributes]
   66 |  __u16 comment_length;
      |        ^~~~~~~~~~~~~~
zip.c:79:8: error: packed attribute causes inefficient alignment for
'magic' [-Werror=attributes]
   79 |  __u32 magic;
      |        ^~~~~
zip.c:80:8: error: packed attribute causes inefficient alignment for
'version' [-Werror=attributes]
   80 |  __u16 version;
      |        ^~~~~~~
zip.c:82:8: error: packed attribute causes inefficient alignment for
'min_version' [-Werror=attributes]
   82 |  __u16 min_version;
      |        ^~~~~~~~~~~
zip.c:83:8: error: packed attribute causes inefficient alignment for
'flags' [-Werror=attributes]
   83 |  __u16 flags;
      |        ^~~~~
zip.c:84:8: error: packed attribute causes inefficient alignment for
'compression' [-Werror=attributes]
   84 |  __u16 compression;
      |        ^~~~~~~~~~~
zip.c:85:8: error: packed attribute causes inefficient alignment for
'last_modified_time' [-Werror=attributes]
   85 |  __u16 last_modified_time;
      |        ^~~~~~~~~~~~~~~~~~
zip.c:86:8: error: packed attribute causes inefficient alignment for
'last_modified_date' [-Werror=attributes]
   86 |  __u16 last_modified_date;
      |        ^~~~~~~~~~~~~~~~~~
zip.c:87:8: error: packed attribute causes inefficient alignment for
'crc' [-Werror=attributes]
   87 |  __u32 crc;
      |        ^~~
zip.c:88:8: error: packed attribute causes inefficient alignment for
'compressed_size' [-Werror=attributes]
   88 |  __u32 compressed_size;
      |        ^~~~~~~~~~~~~~~
zip.c:89:8: error: packed attribute causes inefficient alignment for
'uncompressed_size' [-Werror=attributes]
   89 |  __u32 uncompressed_size;
      |        ^~~~~~~~~~~~~~~~~
zip.c:90:8: error: packed attribute causes inefficient alignment for
'file_name_length' [-Werror=attributes]
   90 |  __u16 file_name_length;
      |        ^~~~~~~~~~~~~~~~
zip.c:91:8: error: packed attribute causes inefficient alignment for
'extra_field_length' [-Werror=attributes]
   91 |  __u16 extra_field_length;
      |        ^~~~~~~~~~~~~~~~~~
zip.c:92:8: error: packed attribute causes inefficient alignment for
'file_comment_length' [-Werror=attributes]
   92 |  __u16 file_comment_length;
      |        ^~~~~~~~~~~~~~~~~~~
zip.c:94:8: error: packed attribute causes inefficient alignment for
'disk' [-Werror=attributes]
   94 |  __u16 disk;
      |        ^~~~
zip.c:95:8: error: packed attribute causes inefficient alignment for
'internal_attributes' [-Werror=attributes]
   95 |  __u16 internal_attributes;
      |        ^~~~~~~~~~~~~~~~~~~
zip.c:108:8: error: packed attribute causes inefficient alignment for
'magic' [-Werror=attributes]
  108 |  __u32 magic;
      |        ^~~~~
zip.c:110:8: error: packed attribute causes inefficient alignment for
'min_version' [-Werror=attributes]
  110 |  __u16 min_version;
      |        ^~~~~~~~~~~
zip.c:111:8: error: packed attribute causes inefficient alignment for
'flags' [-Werror=attributes]
  111 |  __u16 flags;
      |        ^~~~~
zip.c:112:8: error: packed attribute causes inefficient alignment for
'compression' [-Werror=attributes]
  112 |  __u16 compression;
      |        ^~~~~~~~~~~
zip.c:113:8: error: packed attribute causes inefficient alignment for
'last_modified_time' [-Werror=attributes]
  113 |  __u16 last_modified_time;
      |        ^~~~~~~~~~~~~~~~~~
zip.c:114:8: error: packed attribute causes inefficient alignment for
'last_modified_date' [-Werror=attributes]
  114 |  __u16 last_modified_date;
      |        ^~~~~~~~~~~~~~~~~~
zip.c:118:8: error: packed attribute causes inefficient alignment for
'file_name_length' [-Werror=attributes]
  118 |  __u16 file_name_length;
      |        ^~~~~~~~~~~~~~~~
zip.c:119:8: error: packed attribute causes inefficient alignment for
'extra_field_length' [-Werror=attributes]
  119 |  __u16 extra_field_length;
      |        ^~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Build links,
https://storage.tuxsuite.com/public/linaro/lkft/builds/2MfXEyvgh4ba9y3rkt6KPf6sUMR/


History link,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230314/testrun/15564056/suite/build/test/gcc-10-lkftconfig-perf/history/


--
Linaro LKFT
https://lkft.linaro.org
