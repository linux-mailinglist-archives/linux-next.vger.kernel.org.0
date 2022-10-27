Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89AA860ECD2
	for <lists+linux-next@lfdr.de>; Thu, 27 Oct 2022 02:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbiJ0AF5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Oct 2022 20:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbiJ0AF4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Oct 2022 20:05:56 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B71049B56
        for <linux-next@vger.kernel.org>; Wed, 26 Oct 2022 17:05:55 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id f193so16706012pgc.0
        for <linux-next@vger.kernel.org>; Wed, 26 Oct 2022 17:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpvHAtEJAdnJXNPB6jLNzA2rsIXVgrYWXkTdDDznyRM=;
        b=Ulrun5gZgGjQmShW0UweaHSvqXZd9VL1QOY9Fc9U7xLWfD64w6//V+BtkzS8dkZcvh
         nhUgs11hbV7dWBpYgssRCoR5dysLmJeyNJK5Wcqly7wCOQHR9AvPHdTFeffTc6WnA2RQ
         afBpmqFUisu6POh7cXHSjdnesESTxNSpUGRmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpvHAtEJAdnJXNPB6jLNzA2rsIXVgrYWXkTdDDznyRM=;
        b=1sQyj3knggi77VaV1AT0R1a+vs5TDPiixnH8qf4PmkpMMFcD/0CIW2OKTLemzHRzr1
         B7SXNyZVh7m9XifVYDGQ0fdAxJ2gBarlgB+BXVLZTtuUSsiJ6ZH8XzmrPs/3OhGa13gE
         FkHDokI7Cm5cjkd8f4fPIVDnsjMZ5xWZYOKqe4ccR+Hp9+Ndqmjz9nI8LSwJ6qmRi0yG
         WMR0cgGbJv8lO5uxQRxKB5BVNy2L8OEtZ6Ogk+y9i1EHDahnwoDZR1LLH21ms7HZMnLc
         v0gUMQ1Za5rU+OeRkeCY+a+RhQ7XL+mFQSksxTyIHyQ5vNbZNqO3nZfQKydwq9I5RTFg
         1kYA==
X-Gm-Message-State: ACrzQf3fCIu9d4CymtyhgvXA33kM5H5e4Q/p1z7Ft6eze+my18fIPc6G
        8KnZDanVgpHBb8cnzsbBuestPA==
X-Google-Smtp-Source: AMsMyM5lFtwLL+VW0pZCJH1OkUiuWUGg1OSlOkH1bnIwztVKsX0bi2d3MoWLCWsBCzEBOm5GMfxukw==
X-Received: by 2002:a63:ed01:0:b0:445:4345:4a21 with SMTP id d1-20020a63ed01000000b0044543454a21mr39893224pgi.404.1666829154600;
        Wed, 26 Oct 2022 17:05:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c4-20020a170903234400b00178b9c997e5sm3479477plh.138.2022.10.26.17.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 17:05:54 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 26 Oct 2022 17:05:53 -0700
To:     Nick Terrell <terrelln@fb.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: HUF_buildCTableFromTree(): Memory - corruptions
Message-ID: <202210261704.A5AAF0C@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221026 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Oct 24 12:12:32 2022 -0700
    2aa14b1ab2c4 ("zstd: import usptream v1.5.2")

Coverity reported the following:

*** CID 1525550:  Memory - corruptions  (OVERRUN)
/lib/zstd/compress/huf_compress.c: 673 in HUF_buildCTableFromTree()
667                 min += nbPerRank[n];
668                 min >>= 1;
669         }   }
670         for (n=0; n<alphabetSize; n++)
671             HUF_setNbBits(ct + huffNode[n].byte, huffNode[n].nbBits);   /* push nbBits per symbol, symbol order */
672         for (n=0; n<alphabetSize; n++)
vvv     CID 1525550:  Memory - corruptions  (OVERRUN)
vvv     Overrunning array "valPerRank" of 13 2-byte elements at element index 255 (byte offset 511) using index "HUF_getNbBits(ct[n])" (which evaluates to 255).
673             HUF_setValue(ct + n, valPerRank[HUF_getNbBits(ct[n])]++);   /* assign value within rank, symbol order */
674         CTable[0] = maxNbBits;
675     }
676
677     size_t HUF_buildCTable_wksp (HUF_CElt* CTable, const unsigned* count, U32 maxSymbolValue, U32 maxNbBits, void* workSpace, size_t wkspSize)
678     {


*** CID 1525549:  Memory - illegal accesses  (OVERRUN)
/lib/zstd/compress/huf_compress.c: 187 in HUF_writeCTable_wksp()
181
182         /* convert to weight */
183         wksp->bitsToWeight[0] = 0;
184         for (n=1; n<huffLog+1; n++)
185             wksp->bitsToWeight[n] = (BYTE)(huffLog + 1 - n);
186         for (n=0; n<maxSymbolValue; n++)
vvv     CID 1525549:  Memory - illegal accesses  (OVERRUN)
vvv     Overrunning array "wksp->bitsToWeight" of 13 bytes at byte offset 255 using index "HUF_getNbBits(ct[n])" (which evaluates to 255).
187             wksp->huffWeight[n] = wksp->bitsToWeight[HUF_getNbBits(ct[n])];
188
189         /* attempt weights compression by FSE */
190         if (maxDstSize < 1) return ERROR(dstSize_tooSmall);
191         {   CHECK_V_F(hSize, HUF_compressWeights(op+1, maxDstSize-1, wksp->huffWeight, maxSymbolValue, &wksp->wksp, sizeof(wksp->wksp)) );
192             if ((hSize>1) & (hSize < maxSymbolValue/2)) {   /* FSE compressed */


*** CID 1525501:  Memory - corruptions  (OVERRUN)
/lib/zstd/compress/huf_compress.c: 253 in HUF_readCTable()
247                 HUF_setNbBits(ct + n, (BYTE)(tableLog + 1 - w) & -(w != 0));
248         }   }
249
250         /* fill val */
251         {   U16 nbPerRank[HUF_TABLELOG_MAX+2]  = {0};  /* support w=0=>n=tableLog+1 */
252             U16 valPerRank[HUF_TABLELOG_MAX+2] = {0};
vvv     CID 1525501:  Memory - corruptions  (OVERRUN)
vvv     Overrunning array "nbPerRank" of 14 2-byte elements at element index 255 (byte offset 511) using index "HUF_getNbBits(ct[n])" (which evaluates to 255).
253             { U32 n; for (n=0; n<nbSymbols; n++) nbPerRank[HUF_getNbBits(ct[n])]++; }
254             /* determine stating value per rank */
255             valPerRank[tableLog+1] = 0;   /* for w==0 */
256             {   U16 min = 0;
257                 U32 n; for (n=tableLog; n>0; n--) {  /* start at n=tablelog <-> w=1 */
258                     valPerRank[n] = min;     /* get starting value within each rank */


*** CID 1525481:  Memory - corruptions  (OVERRUN)
/lib/zstd/compress/huf_compress.c: 263 in HUF_readCTable()
257                 U32 n; for (n=tableLog; n>0; n--) {  /* start at n=tablelog <-> w=1 */
258                     valPerRank[n] = min;     /* get starting value within each rank */
259                     min += nbPerRank[n];
260                     min >>= 1;
261             }   }
262             /* assign value within rank, symbol order */
vvv     CID 1525481:  Memory - corruptions  (OVERRUN)
vvv     Overrunning array "valPerRank" of 14 2-byte elements at element index 255 (byte offset 511) using index "HUF_getNbBits(ct[n])" (which evaluates to 255).
263             { U32 n; for (n=0; n<nbSymbols; n++) HUF_setValue(ct + n, valPerRank[HUF_getNbBits(ct[n])]++); }
264         }
265
266         *maxSymbolValuePtr = nbSymbols - 1;
267         return readSize;
268     }


*** CID 1505962:    (UNINIT)
/lib/zstd/compress/zstd_compress.c: 2436 in ZSTD_buildSequencesStatistics()
2430                     prevEntropy->offcodeCTable,
2431                     sizeof(prevEntropy->offcodeCTable),
2432                     entropyWorkspace, entropyWkspSize);
2433                 if (ZSTD_isError(countSize)) {
2434                     DEBUGLOG(3, "ZSTD_buildCTable for Offsets failed");
2435                     stats.size = countSize;
vvv     CID 1505962:    (UNINIT)
vvv     Using uninitialized value "stats". Field "stats.MLtype" is uninitialized.
2436                     return stats;
2437                 }
2438                 if (stats.Offtype == set_compressed)
2439                     stats.lastCountSize = countSize;
2440                 op += countSize;
2441                 assert(op <= oend);
/lib/zstd/compress/zstd_compress.c: 2404 in ZSTD_buildSequencesStatistics()
2398                     prevEntropy->litlengthCTable,
2399                     sizeof(prevEntropy->litlengthCTable),
2400                     entropyWorkspace, entropyWkspSize);
2401                 if (ZSTD_isError(countSize)) {
2402                     DEBUGLOG(3, "ZSTD_buildCTable for LitLens failed");
2403                     stats.size = countSize;
vvv     CID 1505962:    (UNINIT)
vvv     Using uninitialized value "stats". Field "stats.Offtype" is uninitialized.
2404                     return stats;
2405                 }
2406                 if (stats.LLtype == set_compressed)
2407                     stats.lastCountSize = countSize;
2408                 op += countSize;
2409                 assert(op <= oend);


*** CID 1505959:  Memory - corruptions  (OVERRUN)
/lib/zstd/compress/zstd_compress.c: 3220 in ZSTD_estimateBlockSize_sequences()
3214                                                       const ZSTD_fseCTablesMetadata_t* fseMetadata,
3215                                                       void* workspace, size_t wkspSize,
3216                                                       int writeEntropy)
3217     {
3218         size_t sequencesSectionHeaderSize = 1 /* seqHead */ + 1 /* min seqSize size */ + (nbSeq >= 128) + (nbSeq >= LONGNBSEQ);
3219         size_t cSeqSizeEstimate = 0;
vvv     CID 1505959:  Memory - corruptions  (OVERRUN)
vvv     Overrunning array "OF_defaultNorm" of 29 2-byte elements by passing it to a function which accesses it at element index 31 (byte offset 63) using argument "31U".
3220         cSeqSizeEstimate += ZSTD_estimateBlockSize_symbolType(fseMetadata->ofType, ofCodeTable, nbSeq, MaxOff,
3221                                              fseTables->offcodeCTable, NULL,
3222                                              OF_defaultNorm, OF_defaultNormLog, DefaultMaxOff,
3223                                              workspace, wkspSize);
3224         cSeqSizeEstimate += ZSTD_estimateBlockSize_symbolType(fseMetadata->llType, llCodeTable, nbSeq, MaxLL,
3225                                              fseTables->litlengthCTable, LL_bits,


If these are false positives, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make sure
fixes get into linux-next. :) For patches fixing this, please include
these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1525550 ("Memory - corruptions")
Fixes: 2aa14b1ab2c4 ("zstd: import usptream v1.5.2")

Thanks for your attention!

-- 
Coverity-bot
